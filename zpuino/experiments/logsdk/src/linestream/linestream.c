#include <zpuino.h>
#include <zpuino-types.h>
#include <serial.h>

#include "linestream.h"
#include "linestream_internal.h"

static int unEscaping=0, inFrame=0;
unsigned int txSeq, rxSeq;

void sendByte(unsigned char b)
{
	if (b==HDLC_frameFlag || b==HDLC_escapeFlag) 
	{
		serial_write(HDLC_escapeFlag);
		b ^= HDLC_escapeXOR;
	}
	serial_write(b);
}

void sendData(const unsigned char *buf, unsigned size)
{
	for(;size>0;size--,buf++) 
	{
		sendByte(*buf);
	}
}

int readData()
{
	while (!serial_available());
	return serial_read();
}

int linestream_receiveFrame(unsigned char *dest, unsigned maxsize)
{
	unsigned char *dptr = dest;
	unsigned int bIn;
	unsigned int ctrl = 0;
	unsigned int checksum=0;

	state = CONTROL;

	do 
	{
		bIn = readData();

		if (bIn==HDLC_escapeFlag) 
		{
			unEscaping=1;
			continue;
		}
		if (bIn==HDLC_frameFlag && !unEscaping) 
		{
			if (inFrame) 
			{
				inFrame = 0;				
				/* Check frame type */
				if (state==CONTROL)	return -1; /* Error, no data */
				state = CONTROL;
				
				/* Checksum computation */
				if (checksum!=0) 
				{
					continue;
				}				
				
				if (!(ctrl & 0x80)) 
				{				
					/* Control frame */
					handleControl(ctrl,dest, dptr-dest);
					if (ctrl==HDLC_Control_Reset) 
					{
						/* Reset Ack frame */						
						*--dptr;
					}						
					continue;
				} 
				else 
				{
					/* Data frame */
					if ( (ctrl & 0x7) != rxSeq ) 
					{
						/* out of order */
						sendNAK();
						continue;
					}
				}
				
				/* Ack this frame */
				rxSeq++;
				rxSeq &= 0x7;

				sendACK();
				
				// removing chk
				*--dptr = '\0';				

				return dptr - dest;

			} 
			else 
			{
				/* Beginning of packet */
				inFrame = 1;
				state = CONTROL;
		    	checksum=0xaa;
			}
		} 
		else 
		{
			if (!inFrame)
                continue;
			if (unEscaping) 
			{
				bIn^=HDLC_escapeXOR;
				unEscaping=0;
			}
			checksum^=bIn;
			
			/* State processing */
			switch (state) 
			{
				case CONTROL:
					ctrl = bIn;
					state=DATA;
					break;
				case DATA:
					if (maxsize-- == 0) 
					{
						return -1;  /* Overflow */
					}
					*dptr++=bIn;
					break;
			}
		}
	} 
	while (1);
}

void sendFrame1(unsigned int value)
{
    unsigned int checksum=0xaa;
	serial_write(HDLC_frameFlag);
	
	sendByte(value);
	
	checksum ^= value;
	sendByte(checksum);
	
	serial_write(HDLC_frameFlag);
}

void handleControl(unsigned char control, unsigned char *buf, unsigned datasize)
{
	/* We received a control sequence */
	if(control == HDLC_Control_Reset)
	{
		/* Reset */
		sendFrame1(HDLC_Control_ResetAck);
		rxSeq=txSeq=0;	
	}
}


void sendNAK()
{
	sendFrame1(HDLC_Control_NAK | rxSeq);
}

void sendACK()
{
	sendFrame1(HDLC_Control_ACK | rxSeq);
}
