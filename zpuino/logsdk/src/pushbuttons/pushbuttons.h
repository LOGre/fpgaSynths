
#ifndef __PUSHBUTTONS_H__
#define __PUSHBUTTONS_H__

#include <zpuino-types.h>
#include <register.h>

#define BUT_NORTH   FPGA_PIN_V4
#define BUT_EAST    FPGA_PIN_H13
#define BUT_WEST 	FPGA_PIN_V18
// South reserved for reset

typedef enum pb_button {PB_NORTH=0, PB_EAST, PB_WEST} pb_button_t;

/*
 * int sw_readState();
 * 
 */ 
int pb_readState(pb_button_t button);

#endif /* __PUSHBUTTONS_H__ */
