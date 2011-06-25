
#ifndef __KNOB_H__
#define __KNOB_H__

#include <zpuino-types.h>
#include <register.h>

#define ROT_A       FPGA_PIN_K18
#define ROT_B       FPGA_PIN_G18
#define ROT_CENTER  FPGA_PIN_V16

/*
 * int knob_readEncoder();
 * 
 * return: 1 if turned right, -1 if turned left, 0 else
 * Should be called from a 1KHz interrupt
 */ 
int knob_readEncoder();

/*
 * void knob_debounce();
 * 
 * Should be called from a 1KHz interrupt, before calling readKnobEncoder()
 */ 
void knob_debounce();

/*
 * int knob_isPushed();
 * 
 * return 1 if the button was pushed, 0 else.
 */
int knob_isPushed();

#endif /* __KNOB_H__ */
