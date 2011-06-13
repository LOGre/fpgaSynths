#ifndef __LINESTREAMSERVER_H__
#define __LINESTREAMSERVER_H__

#include "Transmitter.h"
#include "TransmitQueue.h"
#include "DataFrame.h"
	
class LineStreamServer: public Transmitter
{
	
public:
	LineStreamServer();
	LineStreamServer(int fdread, int fdwrite);
	void stream(const unsigned char*data, unsigned size);
	bool canTransmit() const;
	void sendRaw(unsigned char b);
	void sendByte(unsigned char b);
	void sendData(const unsigned char *buf, unsigned size);
	void open();
	void sendFrame1(unsigned int value);
	int readData(unsigned timeout);
	void transmit(const DataFrame *frame, unsigned sequence);
	int handleIfControlFrame(Frame &f);
	void handleControl(Frame &f);
	void sendNAK();
	void sendACK();
	Frame receiveFrame(unsigned timeout);
	
public:
	unsigned char buffer[128];
	int fdread,fdwrite;
	TransmitQueue txQueue;
	
	
protected:


};

#endif
