#include <interrupt.h>
#include "cbuffer.h"

volatile unsigned int head = 0, tail = 0;
volatile unsigned int itemCount = 0;
static const unsigned int mask = (1<<10)-1;
uint8_t buffer[1<<10];

unsigned buffer_increment(unsigned int i);


int buffer_hasData()
{ 
	return head!=tail; 
}

int buffer_isFull()
{ 
	return  (((tail+1) & mask) == head); 
}

unsigned int buffer_count()
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

int buffer_push(uint8_t value) 
{
	unsigned int nextTail = buffer_increment(tail);
	if(nextTail != head)
	{
		buffer[tail] = value;
		tail = nextTail;
		itemCount++;
		return 1; //true
	}
	return 0; //false
}

uint8_t buffer_pop()
{
	// No checks
	uint8_t ret = buffer[head];
	head = buffer_increment(head);
	if(itemCount>0) itemCount--;
	return ret;
}

void buffer_clear()
{
	cli();
	head=tail=0;
	itemCount = 0;
	sei();
}

unsigned buffer_increment(unsigned int i)
{
	return (i+1)&mask;
}


