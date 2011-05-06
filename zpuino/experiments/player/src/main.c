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
#include <sys/types.h>
#include <fcntl.h>
#include "serial.h"


static void send_sync_sequence(serial_handle_t* h)
{
  static const uint16_t sync_seq = 0xa5a5;
  size_t nwritten;
  serial_write(h, (const void*)&sync_seq, 2, &nwritten);
}


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

  send_sync_sequence(&handle);

  while (1)
  {
    usleep(20000);

    if (size < 28)
    {
      size = saved_size;
      addr = saved_addr;
    }
    
    if (serial_write(&handle, addr, 28, &nwritten) == -1)
    {
      printf("serial_write() == -1\n");
    }
    else if (nwritten != 28)
    {
      printf("nwritten != 28\n");
    }

    addr += nwritten;
    size -= nwritten;
  }

  close(fd);

  return 0;
}



