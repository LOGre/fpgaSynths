#include <queue>
#include <stdio.h>
#include <sys/select.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <exception>
#include <pty.h> // Only for testing
#include <sys/wait.h> // Only for testing
#include <string>
#include <pthread.h>

#include "LineStreamClient.h"

#define LOG(x...) do { fprintf(stderr,"Server: "); fprintf(stderr,x); fflush(stderr); } while (0);

bool do_exit = false;

class MyException: public std::exception
{
public:
	MyException(const std::string &s): reason(s) {}
	~MyException() throw () {}

	virtual const char *what() const throw () { return reason.c_str(); }
private:
	std::string reason;
};

class ReadException: public MyException
{
public:
	ReadException(): MyException("read") {};
};

class FrameTooShortException: public MyException
{
public:
	FrameTooShortException(): MyException("short frame") {};
};

class BufferFullException: public MyException
{
public:
	BufferFullException(): MyException("buffer full") {};
};

class ChecksumErrorException: public MyException
{
public:
	ChecksumErrorException(): MyException("checksum error") {};
};

class DataFrame: public std::string {  // This should hold the data buffer
public:
	DataFrame(const unsigned char*d,unsigned size): std::string((char*)d,size) {}
	unsigned char *pointer() const { return (unsigned char*)c_str(); }
};

/* Simple HDLC frame */
struct Frame {
	unsigned int control;
	Frame(unsigned int ctrl, unsigned char *buf, unsigned size):
		control(ctrl) , data(buf,size) {
	}
	DataFrame data;
};

/* Interface */
class Transmitter
{
public:
	virtual void transmit(const DataFrame *frame, unsigned sequence) = 0;
};


class TransmitQueue
{
public:
	TransmitQueue()
	{
		int i;
		for (i=0;i<7;i++) {
			slots[i] = NULL;
		}
		txlow=txhigh=0;
	}

	void reset()
	{
		int i;
		for (i=0;i<7;i++) {
			if (slots[i]!=NULL) {
                delete slots[i];
			}
			slots[i] = NULL;
		}
		txlow=txhigh=0;
	}

	bool empty() const {
		return toBeAcked()==0;
	}

	unsigned toBeAcked() const {
		unsigned tb = (txhigh - txlow) & 0x7;
		LOG("To be acked: %d\n",tb);
		return tb;
	}

	bool full() const {
		return (toBeAcked() == 7);
	}

	void queueAndTransmit(Transmitter &t, DataFrame *frame)
	{
		slots[txhigh] = frame;
		t.transmit(frame,txhigh++);
		txhigh &= 0x7;
	}

	void ackUpTo(unsigned int v) {
		unsigned i = txlow;

		while (i!=v) {
			if (slots[i]) {
				/* Remove */
				LOG("Acking %u (%p) and freeing, %d in queue now\n",i,slots[i], toBeAcked()-1);
				delete(slots[i]);
				slots[i]=NULL;
			} else {
				LOG("Ack'ing non ackable frame %u\n",i);
			}
			txlow=v;
			LOG("ACK now %d\n",txlow);
			i++;
			i&=7;
		}
	}

public:
	DataFrame *slots[8]; 

	unsigned txlow,txhigh;
};


class LineStreamServer: public Transmitter
{
	unsigned char buffer[128];
	int fdread,fdwrite;
	TransmitQueue txQueue;

public:
	LineStreamServer(int fdr, int fdw): fdread(fdr), fdwrite(fdw) {
	}

	void stream(const unsigned char*data, unsigned size) {
        txQueue.queueAndTransmit( *this, new DataFrame(data,size));
	}

	bool canTransmit() const {
		return !txQueue.full();
	}
	void sendRaw(unsigned char b)
	{
		write(fdwrite,&b,1);
	}
	void sendByte(unsigned char b)
	{
		if (b==HDLC_frameFlag || b==HDLC_escapeFlag) {
			sendRaw(HDLC_escapeFlag);
			b ^= HDLC_escapeXOR;
		}
		sendRaw(b);
	}


	void sendData(const unsigned char *buf, unsigned size)
	{
		for(;size>0;size--,buf++) {
			sendByte(*buf);
		}
	}

	void open()
	{
		txQueue.reset();
		do {
			try {

				sendFrame1(HDLC_Control_Reset);
				Frame f = receiveFrame(1000);
				if (f.control==HDLC_Control_ResetAck) {
					return;
				}
			} catch (std::exception &e) {
				fprintf(stderr,"Caught exception: %s\n",e.what());
			}
		} while (1);
	}

	void sendFrame1(unsigned int value)
	{
		unsigned int checksum=0xaa;
		sendRaw(HDLC_frameFlag);
		sendByte(value);
		checksum ^= value;
		sendByte(checksum);
		sendRaw(HDLC_frameFlag);
	}

	int readData(unsigned timeout)
	{
		unsigned char v;
		struct timeval tv;
		fd_set rfs;

		tv.tv_sec=timeout/1000;
		tv.tv_usec=(timeout%1000)*1000;

		FD_ZERO(&rfs);
		FD_SET(fdread, &rfs);

		switch (select(fdread+1,&rfs,NULL,NULL,&tv)) {
		default:
			if (read(fdread,&v,1)!=1)
				return -1;
			return v;
			break;
		case 0:
		case -1:
			return -1;
		}
	}

	void transmit(const DataFrame *frame, unsigned sequence)
	{
		unsigned int checksum=0xaa;
		unsigned size = frame->size();
		unsigned char *data = frame->pointer();

		sendRaw(HDLC_frameFlag);
		unsigned int value = 0x80 | sequence;
		sendByte(value);
		checksum ^= value;

		while (size--) {
			sendByte(*data);
			checksum^=*data++;
		}

		sendByte(checksum);
		sendRaw(HDLC_frameFlag);
	}

	int handleIfControlFrame(Frame &f)
	{
		if (!(f.control&0x80)) {
			handleControl(f);
            return 0;
		}
		return 1;
	}

	void handleControl(Frame &f)
	{
		LOG("Got control frame 0x%02x\n",f.control);
		if ((f.control&0xf0) == HDLC_Control_ACK) {
			LOG("Got ACK frame for sequence %d\n", f.control&0x7);
            txQueue.ackUpTo(f.control&0x7);
		}
	}

	void sendNAK()
	{
	}

	void sendACK()
	{
	}

	Frame receiveFrame(unsigned timeout)
	{
		unsigned char dest[128];
		unsigned char *dptr = dest;
		int bIn;
		unsigned int ctrl = 0;
		unsigned int checksum;
		unsigned int maxsize=sizeof(dest);

		state = CONTROL;
		inFrame=false;
		unEscaping=false;

		do {
			bIn = readData(timeout);
			if (bIn<0) {
				throw ReadException();
			}
			if (bIn==HDLC_escapeFlag) {
				unEscaping=true;
				continue;
			}
			if (bIn==HDLC_frameFlag && !unEscaping) {
				if (inFrame) {
					inFrame = false;
					/* Check frame type */
					if (state==CONTROL)
						throw FrameTooShortException(); /* Error, no data */
					state = CONTROL;
					/* Checksum computation */
					if (checksum!=0) {
						LOG("Checksum error\n");
						continue;
					}
					if (!(ctrl & 0x80)) {
						/* Control frame */
						//handleControl(ctrl,dest, dptr-dest);
						return Frame(ctrl, dest, dptr - dest);

						continue;
					} else {
						/* Data frame - not handled in server*/
                        continue;
					}

					sendACK();

					return Frame(ctrl, dest, dptr - dest);

				} else {
					/* Beginning of packet */
					LOG("Start frame\n");
					inFrame = true;
					state = CONTROL;
					checksum=0xaa;
				}
			} else {
				if (!inFrame)
					continue;
				if (unEscaping) {
					bIn^=HDLC_escapeXOR;
					unEscaping=false;
				}
				checksum^=bIn;
				switch (state) {
				case CONTROL:
					LOG("Control %02x\n", bIn);
					ctrl = bIn;
					state=DATA;
					break;
				case DATA:
					if (maxsize-- == 0) {
						BufferFullException();  /* Overflow */
					}
					LOG("Data %02x\n", bIn);
					*dptr++=bIn;
					break;
				}
				LOG("Checksum now: %02x\n",checksum);
			}
		} while (1);
	}

	enum { CONTROL, DATA } state;
	bool unEscaping, inFrame;

	static unsigned char const HDLC_Control_Reset = 0x00;
	static unsigned char const HDLC_Control_ResetAck = 0x40;
	static unsigned char const HDLC_Control_NAK = 0x20; /* Or-ed with sequence */
	static unsigned char const HDLC_Control_ACK = 0x10; /* Or-ed with sequence */

	static unsigned char const HDLC_frameFlag = 0x7E;
	static unsigned char const HDLC_escapeFlag = 0x7D;
	static unsigned char const HDLC_escapeXOR = 0x20;
};

void *receiverThread(void *arg)
{
	LineStreamServer *server = (LineStreamServer*)arg;

	while (!do_exit) {
		try {
			LOG("Server: Waiting for frame\n");
			Frame f = server->receiveFrame(-1);
			if (server->handleIfControlFrame(f)) {
                /* Data frame */
			}
		} catch (...) {
			LOG("Server: Exception getting frame\n");
		}

	}
	return NULL;
}


void *transmitterThread(void *arg)
{
	LineStreamServer *server = (LineStreamServer*)arg;

	do {
		if ( server->canTransmit()) {
			server->stream((const unsigned char*)"ABCDEF",6);
		} else {
            LOG("TX is full\n");
			/* Wait a bit */
			usleep(20000);
		}
	} while (1);

	return 0;
}

int main()
{
	int fda[2], fdb[2];
	pid_t pid;
    int ret;

	pipe(fda);
	pipe(fdb);

	LineStreamServer *server = new LineStreamServer(fda[0],fdb[1]);

	switch (fork()) {
	case 0:
		{
			unsigned char buffer[128];
			LineStreamClient client(fdb[0], fda[1]);
			close(fdb[1]);
			close(fda[0]);

			while (client.receiveFrame(buffer,sizeof(buffer))>0) {
				// Slow down.
				usleep(30000);

			}
		}
		exit(-1);
	default:
		break;
	}
	/* Close other ends of pipe */
	close(fda[1]);
	close(fdb[0]);

    pthread_t receiverThreadID, transmitterThreadID;

	server->open();

	pthread_create(&receiverThreadID,NULL,&receiverThread, (void*)server);
	pthread_create(&transmitterThreadID,NULL,&transmitterThread, (void*)server);

	waitpid(-1,&ret,0);

    delete (server) ;
}
