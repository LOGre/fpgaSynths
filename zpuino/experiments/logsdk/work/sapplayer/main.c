#include <zpuino.h>
#include <zpuino-types.h>
#include <register.h>
#include <serial.h>
#include <interrupt.h>

// include circular buffer library header.
#include "cbuffer.h"

#define POKEYBASE IO_SLOT(12)
#define POKEYREG(x) REGISTER(POKEYBASE,x)
#define OUTPUTPIN FPGA_PIN_D7

#define QUEUE_MAX_SIZE (18*8)

void setled(unsigned int count);
unsigned ledforvalue(unsigned int value);

void _zpu_interrupt()
{
  // read 9 registers = 1 frame, only if the queue is not empty (at least one frame)
  if(buffer_count() > 18)
  {
    int i = 0;
    unsigned pokeyReg, pokeyRegVal;
    
    // A frame dump is composed of the 9 Pokey registers : reg then value, so 18 bytes per frame
    for(i=0; i<9; i++)
    {
      pokeyReg = buffer_pop();   
      pokeyRegVal = buffer_pop();  
    
      // send the reg value to the Pokey
      POKEYREG(pokeyReg) = pokeyRegVal;    
    }
    
    // display the buffer fillrate using leds
    setled(buffer_count());
  }

  // re-enable int 
  TMR0CTL &= ~(BIT(TCTLIF));
}

void setup50HzInt()
{       
	TMR0CNT = 0;                          /* Clear timer counter */
	TMR0CMP = ((CLK_FREQ/64) / 50) - 1;   /* Set up timer cmp to 30000 ticks, /64 prescaler */
	TMR0CTL = BIT(TCTLENA)|BIT(TCTLCCM)|BIT(TCTLDIR)|BIT(TCTLCP2)|BIT(TCTLCP0)|BIT(TCTLIEN);  /* set prescaler to 64 (16 would be enough...)*/

	INTRMASK=BIT(INTRLINE_TIMER0);       /* Activate Timer0 Line */
	INTRCTL=BIT(0); 						// Globally enable interrupts
}

// Leds
unsigned ledforvalue(unsigned int value)
{
	switch (value) {
	default:
		case 0: return FPGA_LED_0;
		case 1: return FPGA_LED_1;
		case 2: return FPGA_LED_2;
		case 3: return FPGA_LED_3;
		case 4: return FPGA_LED_4;
		case 5: return FPGA_LED_5;
		case 6: return FPGA_LED_6;
		case 7: return FPGA_LED_7;
	}
}

void setled(unsigned int count)
{
  
	// clear leds
	unsigned int led = 0;
	for(led=0; led<8; led++)
	{
		digitalWrite(ledforvalue(led), LOW);    
	}

	// based on count, decide how many leds to show (ugly fast code)
	unsigned int maxLeds = 0;
	unsigned int ratio = QUEUE_MAX_SIZE / 8;

	if(count < 28) maxLeds = 0;
	else if (count >= (ratio*1) && count < (ratio*2)) maxLeds = 1;
	else if (count >= (ratio*2) && count < (ratio*3)) maxLeds = 2;
	else if (count >= (ratio*3) && count < (ratio*4)) maxLeds = 3;
	else if (count >= (ratio*4) && count < (ratio*5)) maxLeds = 4;
	else if (count >= (ratio*5) && count < (ratio*6)) maxLeds = 5;
	else if (count >= (ratio*6) && count < (ratio*7)) maxLeds = 6;
	else if (count >= (ratio*7)) maxLeds = 7;

	for(led=0; led<maxLeds; led++)
	{
		digitalWrite(ledforvalue(led), HIGH);    
	}

}

void setup()
{
	// setup serial
	serial_begin(115200);

	// setup LEDs
	pinMode(FPGA_LED_0,OUTPUT);
	pinMode(FPGA_LED_1,OUTPUT);
	pinMode(FPGA_LED_2,OUTPUT);
	pinMode(FPGA_LED_3,OUTPUT);
	pinMode(FPGA_LED_4,OUTPUT);
	pinMode(FPGA_LED_5,OUTPUT);
	pinMode(FPGA_LED_6,OUTPUT);
	pinMode(FPGA_LED_7,OUTPUT);  
  
	// clear leds
	unsigned led = 0;
	for(led=0; led<8; led++)
	{
		digitalWrite(ledforvalue(led), LOW);    
	}  

	// SPKR thru PPS
	pinMode(OUTPUTPIN,OUTPUT);
	pinModePPS(OUTPUTPIN,HIGH);
	outputPinForFunction( OUTPUTPIN, 14);  

	setled(0);

	// error proof constant note
	// For example, to determine the period multiplier for an A note (440 Hz by definition) using an input clock of 64KHz, the formula is: 63920 / 440 / 2 - 1 = 145.3 / 2 - 1 = 72.64 - 1 = 71.64
	POKEYREG(0x00) = 0x048; // tona A multplier == 72 / 440 Hz
	POKEYREG(0x01) = 0x0AF; // pure tone (A) and max vol (F) for tone A
	POKEYREG(0x08) = 0x00; // AUDCTL to default
}

void loop()
{
	serial_writestr("Starting...\n");
	
	// fill buffer
	while(buffer_count() < QUEUE_MAX_SIZE)
	{
		while (!serial_available());
		buffer_push(serial_read()); 
		setled(buffer_count());
	}

	// set timers
	setup50HzInt();

	// start listening loop
	do 
	{
		while (!serial_available());

		// if the queue is not full and data available, fill it
		if(buffer_count() < QUEUE_MAX_SIZE - 18)
		{
		  buffer_push(serial_read());
		}
	} 
	while (1);
}

