#ifndef __TRANSMITTER_H__
#define __TRANSMITTER_H__

#include "DataFrame.h"

/* Interface */
class Transmitter
{
public:
	virtual void transmit(const DataFrame *frame, unsigned sequence) = 0;
};

#endif /* __TRANSMITTER_H__ */
