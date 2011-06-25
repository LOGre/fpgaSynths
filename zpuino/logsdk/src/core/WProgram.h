#ifndef WProgram_h
#define WProgram_h

#include <zpuino.h>
#include <delay.h>
#include <HardwareSerial.h>

extern char *itoa ( int value, char * str, int base );
extern char *ultoa ( unsigned long value, char * str, int base );
extern char *ltoa ( long value, char * str, int base );


typedef unsigned char boolean;

#ifndef _BV
#define _BV(x) (1<<(x))
#endif

#endif
