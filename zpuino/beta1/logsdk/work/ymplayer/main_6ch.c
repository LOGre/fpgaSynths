#include <zpuino.h>
#include <zpuino-types.h>
#include <register.h>
#include <serial.h>
#include <interrupt.h>
#include <linestream.h>

// include circular buffer library header.
#include "cbuffer.h"

#define NB_YM 2
//#define RAWSERIAL
#define FRAMESIZE 14

#define YM2149BASE1 IO_SLOT(10)
#define YM2149REG1(x) REGISTER(YM2149BASE1,x)

#define YM2149BASE2 IO_SLOT(11)
#define YM2149REG2(x) REGISTER(YM2149BASE2,x)

#define QUEUE_MAX_SIZE (FRAMESIZE*NB_YM*200)

// Leds
inline unsigned ledforvalue(unsigned int value)
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

	if(count < (FRAMESIZE*NB_YM)) maxLeds = 0;
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

void setbinled(unsigned int value)
{
	setled(0);
	if(value == 0) digitalWrite(ledforvalue(7), HIGH); 
	if(value == 1) digitalWrite(ledforvalue(0), HIGH); 
	if(value == 14) digitalWrite(ledforvalue(1), HIGH); 
	if(value > 14) digitalWrite(ledforvalue(2), HIGH); 
	if(value > 28) digitalWrite(ledforvalue(3), HIGH); 
	if(value >= 127) digitalWrite(ledforvalue(4), HIGH); 
	if(value > 200) digitalWrite(ledforvalue(5), HIGH); 
	/*
	int i;
	for(i=0; i< 8; i++)
	{
		digitalWrite(ledforvalue(i), (value & (1 << i))?HIGH:LOW); 
	}*/
}

void _zpu_interrupt()
{
  // read 14 registers = 1 frame, only if the queue is not empty (at least one frame)
  if(buffer_count() > (FRAMESIZE*NB_YM))
  {
    int i = 0;
    uint8_t /*ymReg,*/ ymRegVal;
    
    // A frame dump is composed of the 2*14 YM registers : reg then value, so 2*28 bytes per frame
    
    // YM1
    for(i=0; i<14; i++)
    {
      //ymReg = buffer_pop();   
      ymRegVal = buffer_pop();  
    
      // send the reg value to the YM1
      YM2149REG1(i) = ymRegVal;    
    }
    
    #if NB_YM == 2
	for(i=0; i<14; i++)
	{
	  //ymReg = buffer_pop();   
	  ymRegVal = buffer_pop();  
	
	  // send the reg value to the YM2
	  YM2149REG2(i) = ymRegVal;    
	}    
	#endif
    
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

	setled(0);

	// error proof constant note
	YM2149REG1(0x05) = 0x05;
	YM2149REG1(0x04) = 0x00;
	YM2149REG1(0x07) = 0x3B;
	YM2149REG1(0x0A) = 0x09;
}

void loop()
{
	// fill buffer
	#ifndef RAWSERIAL
	unsigned char buffer[128];
	int nbBytes = 0;
	#endif
	
	while(buffer_count() < QUEUE_MAX_SIZE)
	{	
		#ifdef RAWSERIAL
		while (!serial_available());
		buffer_push(serial_read()); 
		setled(buffer_count());		 
		
		#else
		nbBytes = linestream_receiveFrame(buffer,sizeof(buffer));
		if(nbBytes == FRAMESIZE)
		{
			int i;
			for(i=0; i<nbBytes; i++)
			{
				buffer_push(buffer[i]); 
			}
			setled(buffer_count());	
		}	
		else
		{
			setbinled(nbBytes);
		}
		#endif
	}

	// set timers
	setup50HzInt();

	// start listening loop
	do 
	{
		// if the queue is not full and data available, fill it
		if(buffer_count() < QUEUE_MAX_SIZE - (FRAMESIZE*NB_YM*10))
		{
			#ifdef RAWSERIAL
			while (!serial_available());
			buffer_push(serial_read());
			#else			
			nbBytes = linestream_receiveFrame(buffer, sizeof(buffer));
			if(nbBytes == FRAMESIZE)
			{			
				int i;
				for(i=0; i<nbBytes; i++)
				{
					buffer_push(buffer[i]); 
				}	
			}
			#endif	
		}
	} 
	while (1);
}

