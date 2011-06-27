#include <zpuino.h>
#include <zpuino-types.h>

#define OUTPUTPIN FPGA_PIN_D7
#define SN76489BASE IO_SLOT(14)
#define SN76489REG(x) REGISTER(SN76489BASE,x)

// Leds
uint32_t ledforvalue(uint32_t value)
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

void setup(void)
{
	// setup LEDs
	pinMode(FPGA_LED_0,OUTPUT);
	pinMode(FPGA_LED_1,OUTPUT);
	pinMode(FPGA_LED_2,OUTPUT);
	pinMode(FPGA_LED_3,OUTPUT);
	pinMode(FPGA_LED_4,OUTPUT);
	pinMode(FPGA_LED_5,OUTPUT);
	pinMode(FPGA_LED_6,OUTPUT);
	pinMode(FPGA_LED_7,OUTPUT); 	
	int led = 0;
	for(led=0; led<8; led++)
	{
		digitalWrite(ledforvalue(led), HIGH);    
	} 	
	
	// init PPS
	// SPKR thru PPS
	pinMode(OUTPUTPIN,OUTPUT);
	pinModePPS(OUTPUTPIN,HIGH);
	outputPinForFunction( OUTPUTPIN, 14); 	  
  
	// make the SN76499 rings a A 440 on tone 1, max vol
	SN76489REG(0x00) = 0x011C;
	SN76489REG(0x00) = 0x00;

}

void loop(void)
{
 while (1) ;
}
