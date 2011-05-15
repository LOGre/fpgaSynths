#ifndef __LINESTREAMCLIENT_H__
#define __LINESTREAMCLIENT_H__

class LineStreamClient
{
public:
	LineStreamClient();
#ifdef __linux__
	LineStreamClient(int fdread, int fdwrite);
	void send(unsigned char c);

#endif
	int receiveFrame(unsigned char *dest, unsigned maxsize);

protected:
	void sendByte(unsigned char byte);
	void sendData(const unsigned char *buf, unsigned size);
	void sendNAK();
	void sendACK();
	int readData();
	void handleControl(unsigned char control, unsigned char *buf, unsigned datasize);
	void sendFrame1(unsigned int value);
protected:
	enum { CONTROL, DATA } state;
	bool unEscaping, inFrame;
	unsigned int txSeq, rxSeq;
	static unsigned char const HDLC_frameFlag = 0x7E;
	static unsigned char const HDLC_escapeFlag = 0x7D;
	static unsigned char const HDLC_escapeXOR = 0x20;

	static unsigned char const HDLC_Control_Reset = 0x00;
	static unsigned char const HDLC_Control_ResetAck = 0x40;
	static unsigned char const HDLC_Control_NAK = 0x20; /* Or-ed with sequence */
	static unsigned char const HDLC_Control_ACK = 0x10; /* Or-ed with sequence */
#ifdef __linux__
	int fdread, fdwrite;
#endif
};

#endif
