#include "zpuino.h"
#include "math.h"

void setup(void)
{
  
}

static inline float addf(float fu, float bar)
{  
	return fu + bar; 
}

void loop(void)
{
 volatile float fu = 0.2;
 volatile float bar = 0.4;
 volatile float baz;

 baz = addf(fu, bar);
 baz = sinf(2.0f);

 while (1) ;
}
