#include "LineStreamClient.h"


#ifdef __linux__

#include <stdio.h>
#include <unistd.h>
#include <exception>
#include <errno.h>
#include <string.h>
#include <stdlib.h>

void LineStreamClient::send(unsigned char c)
{
	write(fdwrite,&c,1);
}

LineStreamClient::LineStreamClient(int fdr,int fdw): fdread(fdr), fdwrite(fdw)
{
	unEscaping=inFrame=false;
}

#define TRANSMITBYTE(x) send(x)
#define LOG(x...) do { fprintf(stderr,"Client: "); fprintf(stderr,x); } while (0);
#else

#include "HardwareSerial.h"

#define TRANSMITBYTE(x) Serial.write(x)
#define LOG(x...)
#endif


void LineStreamClient::sendByte(unsigned char b)
{
	if (b==HDLC_frameFlag || b==HDLC_escapeFlag) {
		TRANSMITBYTE(HDLC_escapeFlag);
		b ^= HDLC_escapeXOR;
	}
	TRANSMITBYTE(b);
}

void LineStreamClient::sendData(const unsigned char *buf, unsigned size)
{
	for(;size>0;size--,buf++) {
		sendByte(*buf);
	}
}

LineStreamClient::LineStreamClient()
{
	unEscaping=inFrame=false;
}

int LineStreamClient::readData()
{
#ifdef __linux__
	unsigned char c;
	if (read(fdread,&c,sizeof(c))<=0) {
		LOG("Read error: %s\n",strerror(errno));
		exit(-1);
	}
	return c;
#else
	while (!Serial.available());
	return Serial.read();
#endif
}

int LineStreamClient::receiveFrame(unsigned char *dest, unsigned maxsize)
{
	unsigned char *dptr = dest;
	unsigned int bIn;
	unsigned int ctrl = 0;
	unsigned int checksum=0;

	state = CONTROL;

	do {
		bIn = readData();

		if (bIn==HDLC_escapeFlag) {
			unEscaping=true;
			continue;
		}
		if (bIn==HDLC_frameFlag && !unEscaping) {
			if (inFrame) {
				inFrame = false;
				LOG("End frame\n");
				/* Check frame type */
				if (state==CONTROL)
					return -1; /* Error, no data */
				state = CONTROL;
				/* Checksum computation */
				if (checksum!=0) {
                    LOG("Checksum error\n");
					continue;
				}
				if (!(ctrl & 0x80)) {
					/* Control frame */
					handleControl(ctrl,dest, dptr-dest);
					continue;
				} else {
					LOG("Data frame\n");
					/* Data frame */
					if ( (ctrl & 0x7) != rxSeq ) {
						/* out of order */
						LOG("Out of order, expected %d got %d\n", rxSeq, ctrl&0x7);
						sendNAK();
						continue;
					}
				}
				/* Ack this frame */
				LOG("Acking this frame\n");
				rxSeq++;
				rxSeq &= 0x7;

				sendACK();

				return dptr - dest;

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
				ctrl = bIn;
				state=DATA;
				break;
			case DATA:
				if (maxsize-- == 0) {
					return -1;  /* Overflow */
				}
				*dptr++=bIn;
				break;
			}
		}
	} while (1);
}

void LineStreamClient::sendFrame1(unsigned int value)
{
    unsigned int checksum=0xaa;
	TRANSMITBYTE(HDLC_frameFlag);
	sendByte(value);
	checksum ^= value;
	sendByte(checksum);
	TRANSMITBYTE(HDLC_frameFlag);
}

void LineStreamClient::handleControl(unsigned char control, unsigned char *buf, unsigned datasize)
{
	/* We received a control sequence */
	switch (control) {

	case HDLC_Control_Reset:
		/* Reset */
		sendFrame1(HDLC_Control_ResetAck);
		rxSeq=txSeq=0;
		break;
	default:
		break;
	}
}

void LineStreamClient::sendNAK()
{
	sendFrame1(HDLC_Control_NAK | rxSeq);
}

void LineStreamClient::sendACK()
{
	LOG("Sending ack\n");
	sendFrame1(HDLC_Control_ACK | rxSeq);
}

