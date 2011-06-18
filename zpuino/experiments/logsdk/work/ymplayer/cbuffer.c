#include <interrupt.h>
#include "cbuffer.h"

volatile unsigned int head = 0, tail = 0;
volatile unsigned int itemCount = 0;
static const unsigned int mask = (1<<13)-1;
uint8_t buffer[1<<13];

inline unsigned increment(unsigned int i)
{
	return (i+1)&mask;
}

inline int buffer_hasData()
{ 
	return head!=tail; 
}

inline int buffer_isFull()
{ 
	return  (((tail+1) & mask) == head); 
}

inline unsigned int buffer_count()
{
	// assumed called from push side

	//const unsigned int t = tail & mask;

	// disable ints before reading head
	/*
	cli();

	const unsigned int h = head & mask;

	unsigned int count;
	if (t < h) // underflow
	count = (1 << bits) - h + t;
	else
	count = t - h;


	// restore ints
	sei();

	return count;
	*/
	return itemCount;
          
}

inline int buffer_push(uint8_t value) 
{
	unsigned int nextTail = increment(tail);
	if(nextTail != head)
	{
		buffer[tail] = value;
		tail = nextTail;
		itemCount++;
		return 1; //true
	}
	return 0; //false
}

inline uint8_t buffer_pop()
{
	// No checks
	uint8_t ret = buffer[head];
	head = increment(head);
	if(itemCount>0) itemCount--;
	return ret;
}

inline void buffer_clear()
{
	cli();
	head=tail=0;
	itemCount = 0;
	sei();
}




