
#ifndef __SERIAL_H__
#define __SERIAL_H__

#include <zpuino-types.h>
#include <register.h>

/*
 * 
 */
void serial_setSlot(unsigned int slot);

/*
 * 
 */ 
int serial_available(void);

/*
 * 
 */ 
int serial_read(void);

/*
 * 
 */ 
void serial_flush(void);

/*
 * 
 */ 
void serial_begin(unsigned int baudrate);

/*
 * 
 */ 
void serial_write(unsigned char c);

/*
 * 
 */ 
void serial_writestr(char * c);
	
#endif /* __SERIAL_H__ */
