
#ifndef __KNOB_H__
#define __KNOB_H__

#include <zpuino-types.h>
#include <register.h>

#define ROT_A       FPGA_PIN_K18
#define ROT_B       FPGA_PIN_G18
#define ROT_CENTER  FPGA_PIN_V16

enum {
	ROT_IDLE,
	ROT_EVENT_RIGHT1,
	ROT_EVENT_RIGHT2,
	ROT_EVENT_RIGHT3,
	ROT_EVENT_LEFT1,
	ROT_EVENT_LEFT2,
	ROT_EVENT_LEFT3
} rotary_state = ROT_IDLE;

/* Debounce registers */


#define ROT_RISING_A ((debounce_a&0x3) == 0x1)
#define ROT_RISING_B ((debounce_b&0x3) == 0x1)

#define ROT_FALLING_A ((debounce_a&0x3) == 0x2)
#define ROT_FALLING_B ((debounce_b&0x3) == 0x2)

/*
 * int readKnobEncoder();
 * 
 * return: 1 if turned right, -1 if turned left, 0 else
 * 
 */ 

int readKnobEncoder();
void debounceKnob();

#endif /* __KNOB_H__ */
