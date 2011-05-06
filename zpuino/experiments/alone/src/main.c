#include "zpuino.h"
#include "delay.h"

/*
static inline void write_dac01(void)
{
  const uint32_t data = (MV_TO_DAC(1600) << 0) | (MV_TO_DAC(2500) << 16);
  SIGMADELTADATA = data;
}
*/

static void write_dac0(unsigned int value)
{
#define MV_TO_DAC(__mv) ((__mv) * 19)
  SIGMADELTADATA = value;
}

static unsigned int fade_value = 0;

void _zpu_interrupt(void)
{
  static unsigned int edge_value = 0;

  /* digitalWrite(0, gpio_value); */
  edge_value ^= 1;
  write_dac0(edge_value * MV_TO_DAC(fade_value));
  TMR0CTL &= ~BIT(TCTLIF);
}

#define YM2149BASE IO_SLOT(10)
#define YM2149REG(x) REGISTER(YM2149BASE,x)
#define OUTPUTPIN 0

void setup(void)
{
  // error proof constant note
  YM2149REG(0x05) = 0x05;
  YM2149REG(0x04) = 0x00;
  YM2149REG(0x07) = 0x3B;
  YM2149REG(0x0A) = 0x0f;

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
  // SPKR thru PPS
  pinMode(OUTPUTPIN,OUTPUT);
  pinModePPS(OUTPUTPIN,HIGH);
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
  unsigned int note_index = 0;
  unsigned int delay_index;

  static const unsigned int note_freq[] =
  { 2093, 2349, 2637, 2794, 3136, 3520, 3951, 4186 };

  while (1)
  {
    /* reset fade value */
    disable_timer_int();
    fade_value = 0;
    enable_timer_int();

    /* change note every 1 sec */
    for (delay_index = 0; delay_index < 10; ++delay_index)
    {
      delay(100);

      disable_timer_int();
      fade_value += 310;
      enable_timer_int();
    }

    /* setup timer */
    TMR0CNT = 0;
    TMR0CMP = ((CLK_FREQ/64) / (2 * note_freq[note_index])) - 1;
    note_index = (note_index + 1) & (8 - 1);

    /* Serial.println("baz"); */
  }
}
