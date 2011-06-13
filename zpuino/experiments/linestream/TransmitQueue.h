#ifndef __TRANSMITQUEUE_H__
#define __TRANSMITQUEUE_H__

#include "DataFrame.h"
#include "Transmitter.h"

class TransmitQueue
{
public:
	TransmitQueue();
	void reset();
	bool empty() const;
	unsigned toBeAcked() const;
	bool full() const;
	void queueAndTransmit(Transmitter &t, DataFrame *frame);
	void ackUpTo(unsigned int v);

public:	
	DataFrame *slots[8]; 
	unsigned txlow,txhigh;	
	
};

#endif /* __TRANSMITQUEUE_H__ */
