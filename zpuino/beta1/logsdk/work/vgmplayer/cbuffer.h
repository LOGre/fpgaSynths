#ifndef __CBUFFER_H__
#define __CBUFFER_H__

#include <zpuino-types.h>

int buffer_hasData();

int buffer_isFull();

unsigned int buffer_count();

int buffer_push(uint8_t value); 

uint8_t buffer_pop();

void buffer_clear();

#endif

