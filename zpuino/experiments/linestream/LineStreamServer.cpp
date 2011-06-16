#include <queue>
#include <stdio.h>
#include <sys/select.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <exception>
#include <string>

#include "LineStreamServer.h"
#include "Transmitter.h"
#include "MyException.h"
#include "TransmitQueue.h"

#define LOG(x...) do { fprintf(stderr,"Server: "); fprintf(stderr,x); fflush(stderr); } while (0);

bool unEscaping, inFrame;

static unsigned char const HDLC_Control_Reset = 0x00;
static unsigned char const HDLC_Control_ResetAck = 0x40;
static unsigned char const HDLC_Control_NAK = 0x20; /* Or-ed with sequence */
static unsigned char const HDLC_Control_ACK = 0x10; /* Or-ed with sequence */

static unsigned char const HDLC_frameFlag = 0x7E;
static unsigned char const HDLC_escapeFlag = 0x7D;
static unsigned char const HDLC_escapeXOR = 0x20;

/*
 * Constructors 
 * 
 */	
LineStreamServer::LineStreamServer(int fdr, int fdw): fdread(fdr), fdwrite(fdw), commType(PIPE) {}
LineStreamServer::LineStreamServer(serial_handle_t* handle): handle(handle), commType(SERIAL) {}

/*
 * Public methods
 * 
 */ 
void LineStreamServer::stream(const unsigned char*data, unsigned size) 
{
	txQueue.queueAndTransmit( *this, new DataFrame(data,size));
}

bool LineStreamServer::canTransmit() const 
{
	return !txQueue.full();
}


void LineStreamServer::sendRaw(unsigned char b)
{
	if(commType == PIPE)
	{
		write(fdwrite,&b,1);
	}
	else if(commType == SERIAL)
	{
		//usleep(100);
		size_t nwritten = 0;
		while(serial_write(handle, &b, 1, &nwritten) == -1)
		{
			LOG("flood\n");
			usleep(100000);
		}
		/*		
		if (serial_write(handle, &b, 1, &nwritten) == -1)
		{
			LOG("Exception : sendRaw, tried to send %X\n", b);
			throw WriteException();
		}
		*/
	}
	else
	{
		throw NoCommTypeException();
	}
}
void LineStreamServer::sendByte(unsigned char b)
{
	if (b==HDLC_frameFlag || b==HDLC_escapeFlag) 
	{
		sendRaw(HDLC_escapeFlag);
		b ^= HDLC_escapeXOR;
	}
	sendRaw(b);
}


void LineStreamServer::sendData(const unsigned char *buf, unsigned size)
{
	//LOG("-> Sending all data bytes\n");
	for(;size>0;size--,buf++) 
	{
		sendByte(*buf);
	}
}

void LineStreamServer::open()
{
	txQueue.reset();
	do {
		try {

			sendFrame1(HDLC_Control_Reset);
			LOG("Reset sent\n");
			Frame f = receiveFrame(1000);
			LOG("Receiving reset\n");
			if (f.control==HDLC_Control_ResetAck) 
			{
				LOG("Reset ACK received\n");
				return;
			}
		} catch (std::exception &e) {
			fprintf(stderr,"Caught exception: %s\n",e.what());
		}
	} while (1);
}

void LineStreamServer::sendFrame1(unsigned int value)
{
	unsigned int checksum=0xaa;
	
	//LOG("-> Sending F1 frame start %X\n", HDLC_frameFlag);
	sendRaw(HDLC_frameFlag);
	
	//LOG("-> Sending F1 byte %X\n", value);
	sendByte(value);
	checksum ^= value;
	
	//LOG("-> Sending F1 chk %X\n", checksum);
	sendByte(checksum);
	
	//LOG("-> Sending F1 frame end %X\n", HDLC_frameFlag);
	sendRaw(HDLC_frameFlag);
}

int LineStreamServer::readData(unsigned timeout)
{
	unsigned char v;
	struct timeval tv;

	tv.tv_sec=timeout/1000;
	tv.tv_usec=(timeout%1000)*1000;
	
	if(commType == PIPE)
	{
		//LOG("Pipe comm\n");
		fd_set rfs;
		FD_ZERO(&rfs);
		FD_SET(fdread, &rfs);
		switch (select(fdread+1,&rfs,NULL,NULL,&tv)) 
		{
			default:
				if (read(fdread,&v,1)!=1) return -1;
				return v;
			break;
			case 0:
			case -1:
				return -1;
		}
	}
	else if(commType == SERIAL)
	{
		//LOG("Serial comm enabled\n");
		size_t size = 0;
		if(serial_read(handle, &v, 1, &size) == -1)
		{
			 LOG("error : read: %X\n", v);
			 throw WriteException();
			 return -1;
		}
		//LOG("readData : %X\n", v);
		return v;
	}
	else
	{
		LOG("No comm set\n");
		throw NoCommTypeException();
	}
	
}

void LineStreamServer::transmit(const DataFrame *frame, unsigned sequence)
{
	unsigned int checksum=0xaa;
	unsigned size = frame->size();
	unsigned char *data = frame->pointer();

	LOG("-> Sending start flag byte %X\n", HDLC_frameFlag);
	sendRaw(HDLC_frameFlag);
	
	unsigned int value = 0x80 | sequence;
	LOG("-> Sending control byte %X\n", value);
	sendByte(value);
	checksum ^= value;

	LOG("->[seq %d] Sending %d data bytes: %08X \n<<", sequence, size, data);
	while (size--) 
	{
		printf("%02X ", *data);
		sendByte(*data);
		checksum^=*data++;
	}
	printf(">>\n");

	LOG("\n-> Sending checksum byte %X\n", checksum);
	sendByte(checksum);
	
	LOG("-> Sending end flag byte %X\n", HDLC_frameFlag);
	sendRaw(HDLC_frameFlag);
}

int LineStreamServer::handleIfControlFrame(Frame &f)
{
	if (!(f.control&0x80)) {
		handleControl(f);
		return 0;
	}
	return 1;
}

void LineStreamServer::handleControl(Frame &f)
{
	//LOG("Got control frame 0x%02x\n",f.control);
	if ((f.control&0xf0) == HDLC_Control_ACK) {
		LOG("Got ACK frame for sequence %d\n", f.control&0x7);
		txQueue.ackUpTo(f.control&0x7);
	}
}

void LineStreamServer::sendNAK()
{
}

void LineStreamServer::sendACK()
{
}

Frame LineStreamServer::receiveFrame(unsigned timeout)
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

	do 
	{
		//LOG("Reading byte from serial\n");
		bIn = readData(timeout);
		if (bIn<0) 
		{
			LOG("Unvalid data\n");
			throw ReadException();
		}
		if (bIn==HDLC_escapeFlag) 
		{
			//LOG("Escape flagl\n");
			unEscaping=true;
			continue;
		}
		if (bIn==HDLC_frameFlag && !unEscaping) 
		{
			if (inFrame) 
			{
				//LOG("in frame\n");
				inFrame = false;
				/* Check frame type */
				if (state==CONTROL)
				{
					LOG("FrameTooShortException\n");
					throw FrameTooShortException(); /* Error, no data */
				}
				state = CONTROL;
				/* Checksum computation */
				if (checksum!=0) 
				{
					LOG("Checksum error\n");
					continue;
				}
				
				if (!(ctrl & 0x80)) 
				{
					//LOG("Control frame\n");
					/* Control frame */
					//handleControl(ctrl,dest, dptr-dest);
					return Frame(ctrl, dest, dptr - dest);
					continue;
				} 
				else 
				{
					//LOG("Data frame !!!\n");
					/* Data frame - not handled in server*/
					continue;
				}

				sendACK();

				return Frame(ctrl, dest, dptr - dest);

			} 
			else 
			{
				/* Beginning of packet */
				//LOG("Start frame\n");
				inFrame = true;
				state = CONTROL;
				checksum=0xaa;
			}
		} 
		else 
		{
			if (!inFrame) continue;
			if (unEscaping) 
			{
				//LOG("Escape !\n");
				bIn^=HDLC_escapeXOR;
				unEscaping=false;
			}
			checksum^=bIn;
			switch (state) 
			{
			case CONTROL:
				LOG("Control %02x\n", bIn);
				ctrl = bIn;
				state=DATA;
				break;
			case DATA:
				if (maxsize-- == 0) 
				{
					LOG("BufferFullException\n");
					BufferFullException();  /* Overflow */
				}
				LOG("Data %02x\n", bIn);
				*dptr++=bIn;
				break;
			}
			//LOG("Checksum now: %02x\n",checksum);
		}
	} while (1);
}


