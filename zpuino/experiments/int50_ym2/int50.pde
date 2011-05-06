
// include queue library header.
#include "cbuffer.h"

#define YM2149BASE IO_SLOT(11)
#define YM2149REG(x) REGISTER(YM2149BASE,x)
#define OUTPUTPIN 0

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

void setup()
{
  // setup serial
  Serial.begin(115200);

  
  // SPKR thru PPS
  pinMode(OUTPUTPIN,OUTPUT);
  pinModePPS(OUTPUTPIN,HIGH);
  outputPinForFunction( OUTPUTPIN, 15);  
  
  // error proof constant note
  YM2149REG(0x05) = 0x05;
  YM2149REG(0x04) = 0x00;
  YM2149REG(0x07) = 0x3B;
  YM2149REG(0x0A) = 0x0f;
}

void loop()
{
  Serial.println("Starting microprog.....");
  
  // set timers
  setup50HzInt();
  
  // fill buffer
  while(buffer.count() < QUEUE_MAX_SIZE)
  //while(!buffer.isFull())
  {
    while (!Serial.available());
    buffer.push((unsigned) Serial.read());  
    // Serial.print("Buffer size : ");
    // Serial.println(buffer.count());

  }
    
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


