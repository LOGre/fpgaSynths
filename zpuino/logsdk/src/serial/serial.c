#include <serial.h>

static unsigned int ioslot = IO_SLOT(1);

/*
 * 
 */ 
inline void serial_setSlot(unsigned int slot) 
{
	ioslot = slot;
}

/*
 * 
 */ 
inline int serial_available(void) 
{
	return (REGISTER(ioslot,1) & 1);
}

/*
 * 
 */ 
inline int serial_read(void) 
{
	return REGISTER(ioslot,0);
}

/*
 * 
 */ 
inline void serial_begin(unsigned int baudrate) 
{
	REGISTER(ioslot,1) = (BAUDRATEGEN(baudrate)) | (BIT(UARTEN));
}

/*
 * 
 */ 
inline void serial_write(unsigned char c) 
{
	while ((REGISTER(ioslot,1) & 2) == 2);
	REGISTER(ioslot,0) = c;
}

inline void serial_writestr(char * c) 
{
	while(*c != '\0')
	{
		while ((REGISTER(ioslot,1) & 2) == 2);
		REGISTER(ioslot,0) = *c++;
	}
}
