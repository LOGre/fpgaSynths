/*
** Made by fabien le mentec <texane@gmail.com>
** 
** Started on  Wed Nov 11 14:20:06 2009 texane
** Last update Sat Nov 14 11:36:07 2009 texane
*/



#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <stdint.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <fcntl.h>
#include "serial.h"


int main(int ac, char** av)
{
  struct stat st;
  int fd = open(av[1], O_RDONLY);
  const uint8_t* addr;
  size_t size;
  size_t nwritten;
  size_t saved_size;
  const uint8_t* saved_addr;
  serial_handle_t handle;

  static const serial_conf_t conf =
    {
      115200,
      8,
      SERIAL_PARITY_DISABLED,
      1
    };

  serial_open(&handle, "/dev/ttyUSB1");
  serial_set_conf(&handle, &conf);

  fstat(fd, &st);

  addr = (const uint8_t*)mmap(NULL, st.st_size, PROT_READ, MAP_SHARED, fd, 0);
  if (addr == MAP_FAILED) perror("mmap");
  size = st.st_size;

  saved_size = st.st_size;
  saved_addr = addr;

  while (1)
  {
    usleep(20000);

    if (size < 28)
    {
      size = saved_size;
      addr = saved_addr;
    }
    
    serial_write(&handle, addr, 28, &nwritten);
    addr += 28;
    size -= 28;
  }

  close(fd);

  return 0;
}



