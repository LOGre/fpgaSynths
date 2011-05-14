#include "HardwareSerial.h"

HardwareSerial Serial(1); /* 1st slot */

void HardwareSerial::begin_slow(const unsigned int baudrate) {
	REGISTER(ioslot,1) = BAUDRATEGEN(baudrate)|BIT(UARTEN);
}

/*int HardwareSerial::available()  {
	return (REGISTER(IO_SLOT(base),1) & 1);
}*/

/*
int HardwareSerial::read()  {
	return REGISTER(IO_SLOT(base),0);
    
}   */

void HardwareSerial::write(unsigned char c) {
	while ((REGISTER(ioslot,1) & 2)==2);
	REGISTER(ioslot,0) = c;
}

