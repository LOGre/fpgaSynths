#ifndef __LINESTREAM_INTERNAL_H__
#define __LINESTREAM_INTERNAL_H__

static unsigned char const HDLC_frameFlag = 0x7E;
static unsigned char const HDLC_escapeFlag = 0x7D;
static unsigned char const HDLC_escapeXOR = 0x20;

static unsigned char const HDLC_Control_Reset = 0x00;
static unsigned char const HDLC_Control_ResetAck = 0x40;
static unsigned char const HDLC_Control_NAK = 0x20; /* Or-ed with sequence */
static unsigned char const HDLC_Control_ACK = 0x10; /* Or-ed with sequence */
enum { CONTROL, DATA } state;

void sendByte(unsigned char byte);
void sendData(const unsigned char *buf, unsigned size);
void sendNAK();
void sendACK();
int readData();
void handleControl(unsigned char control, unsigned char *buf, unsigned datasize);
void sendFrame1(unsigned int value);

#endif // __LINESTREAM_INTERNAL_H__ 
