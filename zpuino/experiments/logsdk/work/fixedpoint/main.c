#include "zpuino.h"
#include "fixedptc.h"

void setup(void)
{
  
}

void loop(void)
{
 volatile fixedpt boz;
 boz = fixedpt_sin(2);

 while (1) ;
}
