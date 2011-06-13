
#include <stdio.h>
#include <queue>
#include "TransmitQueue.h"

#define LOG(x...) 
//do { fprintf(stderr,"Server: "); fprintf(stderr,x); fflush(stderr); } while (0);


TransmitQueue::TransmitQueue()
{
	int i;
	for (i=0;i<7;i++) {
		slots[i] = NULL;
	}
	txlow=txhigh=0;
}

void TransmitQueue::TransmitQueue::reset()
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

bool TransmitQueue::empty() const {
	return toBeAcked()==0;
}

unsigned TransmitQueue::TransmitQueue::toBeAcked() const {
	unsigned tb = (txhigh - txlow) & 0x7;
	LOG("To be acked: %d\n",tb);
	return tb;
}

bool TransmitQueue::full() const {
	return (toBeAcked() == 7);
}

void TransmitQueue::queueAndTransmit(Transmitter &t, DataFrame *frame)
{
	slots[txhigh] = frame;
	LOG("Server: queueAndTransmit with txhi = %X\n", txhigh);
	t.transmit(frame,txhigh++);
	txhigh &= 0x7;
}

void TransmitQueue::ackUpTo(unsigned int v) {
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

