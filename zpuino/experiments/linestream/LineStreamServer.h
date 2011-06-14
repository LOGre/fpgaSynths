#ifndef __LINESTREAMSERVER_H__
#define __LINESTREAMSERVER_H__

#include "Transmitter.h"
#include "TransmitQueue.h"
#include "DataFrame.h"
#include "Serial.h"
	
class LineStreamServer: public Transmitter
{
	
public:
	enum e_commType {PIPE, SERIAL};
	enum e_state { CONTROL, DATA };
	
	LineStreamServer();
	LineStreamServer(int fdread, int fdwrite);
	LineStreamServer(serial_handle_t* handle);
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
	
private:
	unsigned char buffer[128];
	int fdread,fdwrite;
	serial_handle_t * handle;
	TransmitQueue txQueue;
	e_commType commType;
	e_state state;


};

#endif
