#ifndef __CBUFFER_H__
#define __CBUFFER_H__

#include <zpuino-types.h>

inline int buffer_hasData();

inline int buffer_isFull();

inline unsigned int buffer_count();

inline int buffer_push(uint8_t value); 

inline uint8_t buffer_pop();

inline void buffer_clear();

#endif

