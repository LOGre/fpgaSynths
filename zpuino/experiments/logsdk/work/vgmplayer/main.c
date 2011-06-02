#include <zpuino.h>
#include <zpuino-types.h>
#include <register.h>
#include <serial.h>
#include <interrupt.h>

// include circular buffer library header.
#include "cbuffer.h"

#define SN76489BASE IO_SLOT(14)
#define SN76489REG(x) REGISTER(SN76489BASE,x)
#define OUTPUTPIN FPGA_PIN_D7

#define QUEUE_MAX_SIZE ((16+8)*8)

void setled(unsigned int count);
unsigned ledforvalue(unsigned int value);

void _zpu_interrupt()
{
  // read 8 registers = 1 frame, only if the queue is not empty (at least one frame)
  if(buffer_count() > (16+8))
  {
    int i = 0;
    unsigned int snReg;
    uint16_t snRegVal;
    
    // A frame dump is composed of the 8 SN76489 registers (16bits) : reg then value, so 16+8 bytes per frame
    for(i=0; i<8; i++)
    {
      snReg = buffer_pop();
      snRegVal = (buffer_pop() << 8);
      snRegVal |= buffer_pop();
      // that's a 16bit word !
    
      // send the reg value to the SN
      SN76489REG(snReg) = snRegVal;    
    }
    
    // display the buffer fillrate using leds
    setled(buffer_count());
  }

  // re-enable int 
  TMR0CTL &= ~(BIT(TCTLIF));
}

void setup60HzInt()
{       
	TMR0CNT = 0;                          /* Clear timer counter */
	TMR0CMP = ((CLK_FREQ/64) / 60) - 1;   /* Set up timer cmp to 25000 ticks, /64 prescaler */
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

	// error proof constant note : A 440 on tone A max vol
	SN76489REG(0x00) = 0x011C;
	SN76489REG(0x01) = 0x00;

}

void loop()
{
	serial_writestr("Starting VGM Player...\n");
	
	// fill buffer
	while(buffer_count() < QUEUE_MAX_SIZE)
	{
		while (!serial_available());
		buffer_push(serial_read()); 
		setled(buffer_count());
	}

	// set timers
	setup60HzInt();

	// start listening loop
	do 
	{
		while (!serial_available());

		// if the queue is not full and data available, fill it
		if(buffer_count() < QUEUE_MAX_SIZE - (16+8))
		{
		  buffer_push(serial_read());
		}
	} 
	while (1);
}

