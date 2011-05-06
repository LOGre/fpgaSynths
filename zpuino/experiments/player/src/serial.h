/*
** Made by texane <texane@gmail.com>
** 
** Started on Sun Oct 26 14:48:36 2008 texane
** Updated on Sun Oct 26 16:21:22 2008 texane
*/



#ifndef SERIAL_H_INCLUDED
# define SERIAL_H_INCLUDED



#include <stdlib.h>



#if __linux__


#include <termios.h>


struct serial_handle
{
  int fd;

  struct termios termios;

#if _DEBUG

  char* name;

#endif /* _DEBUG */
};


#endif /* __linux__ */


typedef struct serial_handle serial_handle_t;



typedef struct serial_conf
{
  unsigned int bauds;
  unsigned char data;

#define SERIAL_PARITY_DISABLED 0
#define SERIAL_PARITY_ODD 1
#define SERIAL_PARITY_EVEN 2
  unsigned char parity;

  unsigned char stop;

#if _DEBUG
  char* name;
#endif

} serial_conf_t;



int serial_open(serial_handle_t*, const char*);
void serial_close(serial_handle_t*);
int serial_set_conf(serial_handle_t*, const serial_conf_t*);
int serial_get_conf(serial_handle_t*, serial_conf_t*);
int serial_read(serial_handle_t*, void*, size_t, size_t*);
int serial_readn(serial_handle_t*, void*, size_t);
int serial_write(serial_handle_t*, const void*, size_t, size_t*);

#if _DEBUG
void serial_print(serial_handle_t*);
#endif



#endif /* ! SERIAL_H_INCLUDED */
