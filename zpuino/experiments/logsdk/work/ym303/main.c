#include <zpuino.h>
#include <zpuino-types.h>
#include <ym2149.h>
#include <pokey.h>
#include <lcd.h>
#include <knob.h>
#include <slideswitches.h>

#define OUTPUTPIN FPGA_PIN_D7

//static uint32_t maxCutoff 		= 0x18;
static uint16_t 	cutoff 			= 0x09;
static uint16_t speedCounter 	= 0;
static uint16_t pattern		 	= 0;
static uint8_t 	ymbuffer[12] 	= { 0x07, 0xFE, // mixer set to tone A only
									0x08, 0x10, // vol A set to enveloppe
									0x0C, 0x00, // rough freq enveloppe
									0x0B, 0x00, // fine freq enveloppe
									0x01, 0x00, // tone A rough freq
									0x00, 0x00 }; // tone A fine freq
static uint8_t patterns[4] 		= { 0x77, 0x3C, 0x77, 0x1E }; // patterns notes freq
static uint8_t currentReg = 0;

char* itoa(uint16_t value, char* result, int base);
void printFrequency(uint16_t reg, uint16_t freq);

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

void clearLeds()
{
	// clear leds
	uint32_t led = 0;
	for(led=0; led<8; led++)
	{
		digitalWrite(ledforvalue(led), LOW);    
	}  	
}

void setLeds(uint8_t val)
{
	int i;
	for(i=0; i<8; i++)
	{
		if(val & (1<<i))
			digitalWrite(ledforvalue(i), HIGH);
		else
			digitalWrite(ledforvalue(i), LOW);
	}
}

void _zpu_interrupt(void)
{
	//uint32_t key = 0;
	uint16_t note = 0;
	int knobdir;
	
	uint16_t buzzerFreq = 0;
	
	speedCounter++;
	speedCounter &= 7;
	
	if(speedCounter == 0)
	{
		pattern++;
		pattern &= 3;
	}
	
	note = patterns[pattern];
	
	ymbuffer[7] = note; // fine freq env
	
	buzzerFreq = cutoff;
	buzzerFreq -= speedCounter;
	
	note <<= 3;
	note /= buzzerFreq;
	
	ymbuffer[9] = note & 0xFF; // rough freq tone A
	ymbuffer[11] = (note >> 8) & 0xFF;  // fine freq tone A
	
	int i=0;
	for(i=0; i<6; i++)
	{
		YM2149_REG( ymbuffer[2*i] ) = ymbuffer[(2*i)+1];
	}
	setLeds(ymbuffer[9]);

	// Debounce inputs
	knob_debounce();
	
	knobdir = knob_readEncoder();
	if (knobdir==1)
	{
		if(currentReg < 5) currentReg++; 
	}
	else if (knobdir==-1)
	{
		if(currentReg > 0) currentReg--;
	}	
	
	printFrequency( ymbuffer[(2*currentReg)], ymbuffer[(2*currentReg)+1] ); 
	
	/*if(speedCounter & 1)
	{
		YM2149_REG(0x05) = 0x05;
		YM2149_REG(0x04) = 0x00;
		YM2149_REG(0x07) = 0x3B;
		YM2149_REG(0x0A) = 0x0f;	
	}
	else
	{
		YM2149_REG(0x05) = 0x02;
		YM2149_REG(0x04) = 0x00;
		YM2149_REG(0x07) = 0x3B;
		YM2149_REG(0x0A) = 0x06;
	}*/

    // Clear Timer0 Interrupt Flag
	TMR0CTL &= ~(BIT(TCTLIF));
}

void printFrequency(uint16_t reg, uint16_t freq)
{
	char * freqStr = "        ";	
	freqStr = itoa(freq, freqStr, 16);
	LCD_move_to(0,0);
	LCD_print(freqStr);		
	LCD_move_to(6,1);	
	LCD_print("POUET");
}

void setupTimer()
{
	// Setup timer for 50hz
	TMR0CNT = 0;                          /* Clear timer counter */
	TMR0CMP = ((CLK_FREQ/50) / 5) - 1;   /* Set up timer cmp to 30000 ticks, /64 prescaler */
	//TMR0CMP = (CLK_FREQ/(5*1024))-1;
	
	//TMR0CTL = BIT(TCTLENA)|BIT(TCTLCCM)|BIT(TCTLDIR)|BIT(TCTLCP2)|BIT(TCTLCP1)|BIT(TCTLCP0)|BIT(TCTLIEN);  /* set prescaler to 64 (16 would be enough...)*/
	TMR0CTL = BIT(TCTLENA)|BIT(TCTLCCM)|BIT(TCTLDIR)|BIT(TCTLCP2)|BIT(TCTLCP0)|BIT(TCTLIEN);  /* set prescaler to 64 (16 would be enough...)*/

	INTRMASK=BIT(INTRLINE_TIMER0);       /* Activate Timer0 Line */
	INTRCTL=BIT(0); // Globally enable interrupts
}

void setup(void)
{
	// setup 50Hz timer
	setupTimer();	
	
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
	clearLeds();		
	
	// init LCD
	LCD_init();	
	
	// init SPKR thru PPS
	pinMode(OUTPUTPIN,OUTPUT);
	pinModePPS(OUTPUTPIN,HIGH);
	outputPinForFunction( OUTPUTPIN, 14); 	
	
	pokey_setDeviceSlot(12); 
	pokey_setAudioCtrl(0x0); // default settings
	
	ym2149_setDeviceSlot(10);
	//ym2149_setEnvelopeShape(YM2149_ENV_1000);	
	YM2149_REG(0x08) = 0x10; // set vol A to max
	YM2149_REG(0x0D) = 0x08; // set env to sawtooth
	
}

char* itoa(uint16_t value, char* result, int base) 
{
		// check that the base if valid
		if (base < 2 || base > 36) { *result = '\0'; return result; }
	
		char* ptr = result, *ptr1 = result, tmp_char;
		int tmp_value;
	
		do 
		{
			tmp_value = value;
			value /= base;
			*ptr++ = "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmnopqrstuvwxyz" [35 + (tmp_value - value * base)];
		} while ( value );
	
		// Apply negative sign
		if (tmp_value < 0) *ptr++ = '-';
		*ptr-- = '\0';
		while(ptr1 < ptr) 
		{
			tmp_char = *ptr;
			*ptr--= *ptr1;
			*ptr1++ = tmp_char;
		}
		return result;
}

void loop(void)
{
	LCD_reset();
	LCD_move_to(0,0);
	LCD_print("TEST");	
	while (1) ;
}
