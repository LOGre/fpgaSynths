
#ifndef __SERIAL_H__
#define __SERIAL_H__

#include <zpuino-types.h>
#include <register.h>

/*
 * 
 */
inline void serial_setSlot(unsigned int slot);

/*
 * 
 */ 
inline int serial_available(void);

/*
 * 
 */ 
inline int serial_read(void);

/*
 * 
 */ 
inline void serial_flush(void);

/*
 * 
 */ 
inline void serial_begin(unsigned int baudrate);

/*
 * 
 */ 
inline void serial_write(unsigned char c);

/*
 * 
 */ 
inline void serial_writestr(char * c);
	
#endif /* __SERIAL_H__ */
