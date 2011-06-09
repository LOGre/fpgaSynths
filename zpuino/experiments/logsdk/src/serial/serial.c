#include <serial.h>

static unsigned int ioslot = IO_SLOT(1);

/*
 * 
 */ 
void serial_setSlot(unsigned int slot) 
{
	ioslot = slot;
}

/*
 * 
 */ 
int serial_available(void) 
{
	return (REGISTER(ioslot,1) & 1);
}

/*
 * 
 */ 
int serial_read(void) 
{
	return REGISTER(ioslot,0);
}

/*
 * 
 */ 
void serial_begin(unsigned int baudrate) 
{
	REGISTER(ioslot,1) = (BAUDRATEGEN(baudrate)) | (BIT(UARTEN));
}

/*
 * 
 */ 
void serial_write(unsigned char c) 
{
	while ((REGISTER(ioslot,1) & 2) == 2);
	REGISTER(ioslot,0) = c;
}

void serial_writestr(char * c) 
{
	while(*c != '\0')
	{
		while ((REGISTER(ioslot,1) & 2) == 2);
		REGISTER(ioslot,0) = *c++;
	}
}
