#include "zpuino.h"
#include "delay.h"
#include "../../logsdk/src/ym2149/ym2149.h"

#define OUTPUTPIN 0

void _zpu_interrupt(void)
{
  TMR0CTL &= ~BIT(TCTLIF);
}

void setup(void)
{
  /* set all the channels to same frequency, max level, no noise */

  unsigned int slots[] = { 10, 11 };
  unsigned int i;
  ym2149_channel_t chan;

  for (i = 0; i < sizeof(slots) / sizeof(slots[0]); ++i)
  {
    /* select the YM module */
    setDeviceSlot(slots[i]);

    for (chan = YM2149_CH_A; chan < YM2149_CH_MAX; ++chan)
    {
      setChannelFrequency(chan, 0x0500);
      setChannelMixerNoise(chan, 1); /* 1 means disabled */
      setChannelMixerTone(chan, 0);
      setChannelVolume(chan, 0x0f);
    }
  }

  /* Serial.begin(9600); */

  /* setup gpios */
  /* pinMode(0, OUTPUT); */
  
  /* setup timer interrupt */
  TMR0CNT = 0;
  TMR0CMP = ((CLK_FREQ/64) / 1000) - 1;
  TMR0CTL =
    BIT(TCTLENA) |
    BIT(TCTLCCM) |
    BIT(TCTLDIR) |
    BIT(TCTLCP2) |
    BIT(TCTLCP0) |
    BIT(TCTLIEN);

  INTRMASK = BIT(INTRLINE_TIMER0);
  INTRCTL = BIT(0);

  /* setup sigma delta */
  /* located at ioslot(5) */

  /* map channel 0 to a15 */
#if 0
  pinMode(15, OUTPUT);
  pinModePPS(15, HIGH);
  outputPinForFunction(15, IOPIN_SIGMADELTA0);
#elif 1
  /* SPKR thru PPS */
  pinMode(OUTPUTPIN, OUTPUT);
  pinModePPS(OUTPUTPIN, HIGH);
  outputPinForFunction( OUTPUTPIN, 14);
#elif 0
  pinMode(0, OUTPUT);
  pinModePPS(0, HIGH);
  outputPinForFunction(0, IOPIN_SIGMADELTA0);
#elif 0
  /* map channel 0 to a14 */
  pinMode(14, OUTPUT);
  pinModePPS(14, HIGH);
  outputPinForFunction(14, IOPIN_SIGMADELTA1);
  /* enable channel 0 */
  SIGMADELTACTL = (1 << 1) | (1 << 0);
#endif
}


static inline void disable_timer_int(void)
{
  INTRMASK &= ~BIT(INTRLINE_TIMER0);
}

static inline void enable_timer_int(void)
{
  INTRMASK |= BIT(INTRLINE_TIMER0);
}

void loop(void)
{
  while (1) ;
}
