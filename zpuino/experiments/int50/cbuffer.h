#ifndef __CBUFFER_H__
#define __CBUFFER_H__

#include "WProgram.h"

template<typename T, unsigned int bits> struct CircularBuffer
{
	CircularBuffer():head(0),tail(0) { itemCount = 0;}

	static const unsigned int mask = (1<<bits)-1;

	inline bool hasData() { return head!=tail; }
	inline bool isFull() { return  (((tail+1) & mask) == head); }

	inline unsigned int count()
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

	bool push(const T &value) {
		unsigned int nextTail = increment(tail);
		if(nextTail != head)
		{
			buffer[tail] = value;
			tail = nextTail;
                        itemCount++;
			return true;
		}
		return false;
	}

	inline T pop()
	{
		// No checks
		T ret = buffer[head];
		head = increment(head);
                if(itemCount>0) itemCount--;
		return ret;
	}

	void clear()
	{
		cli();
		head=tail=0;
                itemCount = 0;
		sei();
	}


	inline unsigned increment(unsigned int i)
	{
		return (i+1)&mask;
	}

	volatile unsigned int head, tail;
        volatile unsigned int itemCount;

	T buffer[1<<bits];
};

#endif

