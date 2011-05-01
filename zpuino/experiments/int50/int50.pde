
// include queue library header.
#include "cbuffer.h"

#define YM2149BASE IO_SLOT(10)
#define YM2149REG(x) REGISTER(YM2149BASE,x)
#define OUTPUTPIN FPGA_PIN_D7

#define QUEUE_MAX_SIZE (28*8)

static CircularBuffer<unsigned,8> buffer; // 8 bits (256 samples), 512 byte

void _zpu_interrupt()
{
  // read 14 registers = 1 frame
  //if(buffer.hasData()) // only if the queue is not empty (at least one frame)
  if(buffer.count() > 28)
  {
    int i = 0;
    unsigned ymReg, ymRegVal;
    
    // A frame dump is composed of the 14 YM registers : reg then value, so 28 bytes per frame
    for(i=0; i<14; i++)
    {
      ymReg = buffer.pop();   
      ymRegVal = buffer.pop();  
    
      // send the reg value to the YM
      YM2149REG(ymReg) = ymRegVal;    
    }
    
    // display the buffer fillrate using leds
    setled((unsigned) buffer.count());
  }

  // re-enable int 
  TMR0CTL &= ~_BV(TCTLIF);
}

void setup50HzInt()
{       
  TMR0CNT = 0;                          /* Clear timer counter */
  TMR0CMP = ((CLK_FREQ/64) / 50) - 1;   /* Set up timer cmp to 30000 ticks, /64 prescaler */
  TMR0CTL = _BV(TCTLENA)|_BV(TCTLCCM)|_BV(TCTLDIR)|_BV(TCTLCP2)|_BV(TCTLCP0)|_BV(TCTLIEN);  /* set prescaler to 64 (16 would be enough...)*/

  INTRMASK=BIT(INTRLINE_TIMER0);       /* Activate Timer0 Line */
  INTRCTL=BIT(0); // Globally enable interrupts
}

// Leds
unsigned ledforvalue(unsigned value)
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

void setled(unsigned count)
{
  
  // clear leds
  unsigned led = 0;
  for(led=0; led<8; led++)
  {
    digitalWrite(ledforvalue(led), LOW);    
  }

  // based on count, decide how many leds to show (ugly fast code)
  unsigned maxLeds = 0;
  
  unsigned ratio = QUEUE_MAX_SIZE / 8;
  
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
  Serial.begin(115200);

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
  YM2149REG(0x05) = 0x05;
  YM2149REG(0x04) = 0x00;
  YM2149REG(0x07) = 0x3B;
  YM2149REG(0x0A) = 0x0f;
}

void loop()
{
  Serial.println("Starting microprog.....");
  
  // fill buffer
  while(buffer.count() < QUEUE_MAX_SIZE)
  //while(!buffer.isFull())
  {
    while (!Serial.available());
    buffer.push((unsigned) Serial.read());  
    //Serial.print("Buffer size : ");
    //Serial.println(queue.count());
    
    setled((unsigned) buffer.count());

  }
  
  // set timers
  setup50HzInt();
  
  // start listening loop
  do 
  {
    while (!Serial.available());
    
    // if the queue is not full and data available, fill it
    if(buffer.count() < QUEUE_MAX_SIZE - 28)
    //if(!buffer.isFull())
    {
      buffer.push((unsigned)Serial.read());
    }
  } 
  while (1);
}


