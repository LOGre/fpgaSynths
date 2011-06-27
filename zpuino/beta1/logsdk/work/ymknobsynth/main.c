#include <zpuino.h>
#include <zpuino-types.h>
#include <ym2149.h>
#include <pokey.h>
#include <lcd.h>
#include <knob.h>
#include <string.h>

#define OUTPUTPIN FPGA_PIN_D7

static uint16_t freq = 0x0500;

char* itoa(uint16_t value, char* result, int base);

void _zpu_interrupt(void)
{
	int knobdir;
	char * lcdBuffer = "        ";

	// Debounce inputs
	knob_debounce();

	// Handle rotary encoder
	knobdir = knob_readEncoder();
	if (knobdir==1)
	{

		if(freq > 10)
		{
			freq -= 10;
					
			lcdBuffer = itoa(freq, lcdBuffer, 10);
			LCD_clear();
			LCD_move_to(0,0);
			LCD_print(lcdBuffer);					

			setChannelFrequency(YM2149_CH_C, freq);
		}
		 
	}
	else if (knobdir==-1)
	{
		if(freq < 4085)
		{
			freq += 10;
					
			lcdBuffer = itoa(freq, lcdBuffer, 10);
			LCD_clear();
			LCD_move_to(0,0);
			LCD_print(lcdBuffer);					

			setChannelFrequency(YM2149_CH_C, freq);
		}
	}

    // Clear Timer0 Interrupt Flag
	TMR0CTL &= ~(BIT(TCTLIF));
}

void setupTimer()
{
	// Setup timer for a 1Khz with prescaler 1024.

	TMR0CMP = (CLK_FREQ/(1000*1024))-1;
    // Clear timer value.
	TMR0CNT = 0x0;

	TMR0CTL = BIT(TCTLENA)  // Enable timer
		|BIT(TCTLCCM)       // Clear on compare match
		|BIT(TCTLDIR)       // Count UP
		|BIT(TCTLCP2)
		|BIT(TCTLCP1)
		|BIT(TCTLCP0)       // Prescaler 1024 (all CP bits on)
		|BIT(TCTLIEN);      // Enable interrupts

	INTRMASK=BIT(INTRLINE_TIMER0); // Activate Timer0 Line
	INTRCTL=BIT(0); // Globally enable interrupts
}

void setup(void)
{
	// setup 1KHz timer
	setupTimer();	
	
	// init LCD
	LCD_init();
	
	// init PPS
	// SPKR thru PPS
	pinMode(OUTPUTPIN,OUTPUT);
	pinModePPS(OUTPUTPIN,HIGH);
	outputPinForFunction( OUTPUTPIN, 14); 	
	
	/* set all the channels to same frequency, max level, no noise */
	/*unsigned int slots[] = { 10, 11 };
	unsigned int i;
	ym2149_channel_t chan;

	for (i = 0; i < sizeof(slots) / sizeof(slots[0]); ++i)
	{
		
		// select the YM module
		setDeviceSlot(slots[i]);

		for (chan = YM2149_CH_A; chan < YM2149_CH_MAX; ++chan)
		{
			setChannelFrequency(chan, 0x0500);
			setChannelMixerNoise(chan, 1); // 1 means disabled
			setChannelMixerTone(chan, 0);
			setChannelVolume(chan, 0x0f);
		}
	}*/


	setDeviceSlot(10);
	setChannelFrequency(YM2149_CH_C, 0x0500);
	setChannelMixerNoise(YM2149_CH_C, 1); // 1 means disabled
	setChannelMixerTone(YM2149_CH_C, 0);
	setChannelVolume(YM2149_CH_C, 0x0f);

	pokey_setDeviceSlot(12); 
	pokey_channel_t pokchan;
	for (pokchan = POKEY_CH_A; pokchan < POKEY_CH_D; ++pokchan) 
	{ 
		pokey_setChannelPeriodMultiplier(pokchan, 0x90); 
		pokey_setChannelControl(pokchan, 0x00); 	 
	}
	pokey_setAudioCtrl(0x0);
}


static inline void disable_timer_int(void)
{
	INTRMASK &= ~BIT(INTRLINE_TIMER0);
}

static inline void enable_timer_int(void)
{
	INTRMASK |= BIT(INTRLINE_TIMER0);
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
	LCD_print("sing");
	while (1) ;
}
