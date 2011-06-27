
#ifndef __SLIDESWITCHES_H__
#define __SLIDESWITCHES_H__

#include <zpuino-types.h>
#include <register.h>

#define SW_0   	FPGA_PIN_L13
#define SW_1    FPGA_PIN_L14
#define SW_2  	FPGA_PIN_H18
#define SW_3	FPGA_PIN_N17

typedef enum sw_button {SW_BUTTON_0=0, SW_BUTTON_1, SW_BUTTON_2, SW_BUTTON_3} sw_button_t;

/*
 * int sw_readState();
 * 
 */ 
int sw_readState(sw_button_t button);

#endif /* __SLIDESWITCHES_H__ */
