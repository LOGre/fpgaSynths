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

#define LOG(x...) 
//do { fprintf(stderr,"Server: "); fprintf(stderr,x); fflush(stderr); } while (0);

enum { CONTROL, DATA } state;

bool unEscaping, inFrame;

static unsigned char const HDLC_Control_Reset = 0x00;
static unsigned char const HDLC_Control_ResetAck = 0x40;
static unsigned char const HDLC_Control_NAK = 0x20; /* Or-ed with sequence */
static unsigned char const HDLC_Control_ACK = 0x10; /* Or-ed with sequence */

static unsigned char const HDLC_frameFlag = 0x7E;
static unsigned char const HDLC_escapeFlag = 0x7D;
static unsigned char const HDLC_escapeXOR = 0x20;

	
LineStreamServer::LineStreamServer(int fdr, int fdw): fdread(fdr), fdwrite(fdw) 
{
}

void LineStreamServer::stream(const unsigned char*data, unsigned size) {
	txQueue.queueAndTransmit( *this, new DataFrame(data,size));
}

bool LineStreamServer::canTransmit() const {
	return !txQueue.full();
}
void LineStreamServer::sendRaw(unsigned char b)
{
	write(fdwrite,&b,1);
}
void LineStreamServer::sendByte(unsigned char b)
{
	if (b==HDLC_frameFlag || b==HDLC_escapeFlag) {
		sendRaw(HDLC_escapeFlag);
		b ^= HDLC_escapeXOR;
	}
	sendRaw(b);
}


void LineStreamServer::sendData(const unsigned char *buf, unsigned size)
{
	printf("-> Sending all data bytes\n");
	for(;size>0;size--,buf++) {
		sendByte(*buf);
	}
}

void LineStreamServer::open()
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

void LineStreamServer::sendFrame1(unsigned int value)
{
	unsigned int checksum=0xaa;
	
	printf("-> Sending F1 frame start %X\n", HDLC_frameFlag);
	sendRaw(HDLC_frameFlag);
	
	printf("-> Sending F1 byte %X\n", value);
	sendByte(value);
	checksum ^= value;
	
	printf("-> Sending F1 chk %X\n", checksum);
	sendByte(checksum);
	
	printf("-> Sending F1 frame end %X\n", HDLC_frameFlag);
	sendRaw(HDLC_frameFlag);
}

int LineStreamServer::readData(unsigned timeout)
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

void LineStreamServer::transmit(const DataFrame *frame, unsigned sequence)
{
	unsigned int checksum=0xaa;
	unsigned size = frame->size();
	unsigned char *data = frame->pointer();

	printf("-> Sending start flag byte %X\n", HDLC_frameFlag);
	sendRaw(HDLC_frameFlag);
	
	unsigned int value = 0x80 | sequence;
	printf("-> Sending control byte %X\n", value);
	sendByte(value);
	checksum ^= value;

	printf("-> Sending %d data bytes: ", size, *data);
	while (size--) 
	{
		printf("%02X ", *data);
		sendByte(*data);
		checksum^=*data++;
	}

	printf("\n-> Sending checksum byte %X\n", checksum);
	sendByte(checksum);
	
	printf("-> Sending end flag byte %X\n", HDLC_frameFlag);
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
	LOG("Got control frame 0x%02x\n",f.control);
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


