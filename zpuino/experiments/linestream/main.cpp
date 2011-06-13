/*
** Made by fabien le mentec <texane@gmail.com>, Shazz and Alvaro
** 
** Started on  Wed Nov 11 14:20:06 2009 texane
** Last update Sat Nov 14 11:36:07 2009 texane
*/


/*
#include "serial.h"
*/

// file
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdint.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <sys/types.h>

// other
#include <stdio.h>
#include <sys/select.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <exception>
#include <string>

#include <pthread.h>
#include <pty.h> // Only for testing
#include <sys/wait.h> // Only for testing

#include "LineStreamClient.h"
#include "LineStreamServer.h"
#include "DataFrame.h"

/*
static void send_sync_sequence(serial_handle_t* h)
{
  static const uint16_t sync_seq = 0xa5a5;
  size_t nwritten;
  serial_write(h, (const void*)&sync_seq, 2, &nwritten);
}
*/

#define LOG(x...) do { fprintf(stderr,"Server: "); fprintf(stderr,x); fflush(stderr); } while (0);

bool do_exit = false;


void *receiverThread(void *arg)
{
	LineStreamServer *server = (LineStreamServer*)arg;

	while (!do_exit) {
		try {
			LOG("Server: Waiting for frame\n");
			Frame f = server->receiveFrame(-1);
			if (server->handleIfControlFrame(f)) {
                /* Data frame */
			}
		} catch (...) {
			LOG("Server: Exception getting frame\n");
		}

	}
	return NULL;
}


void *transmitterThread(void *arg)
{
	// file
	struct stat st;
    int fd = open("test.bin", O_RDONLY);	
	const uint8_t * addr;
	size_t size, nwritten, saved_size;
	const uint8_t* saved_addr;
	
	// get server ptr
	LineStreamServer *server = (LineStreamServer*)arg;

	// map file
	fstat(fd, &st);

	addr = (const uint8_t*)mmap(NULL, st.st_size, PROT_READ, MAP_SHARED, fd, 0);
	if (addr == MAP_FAILED) perror("mmap");
	size = st.st_size;

	saved_size = st.st_size;
	saved_addr = addr;


	int sent = 0;
	do {
		if ( server->canTransmit()) 
		{
			server->stream((const unsigned char*) addr,28);	
			addr += 28;	
			sent++;
		} 
		else 
		{
            LOG("TX is full...wait !!!\n");
			usleep(2000000);
		}
	} 
	while (sent<saved_size/28);

	return 0;
}

int main()
{
	// pipes
	int fda[2], fdb[2];
	pid_t pid;
    int ret;

	pipe(fda);
	pipe(fdb);

	LineStreamServer *server = new LineStreamServer(fda[0],fdb[1]);

	switch (fork()) 
	{
		case 0:
		{
			unsigned char buffer[128];
			buffer[0] = '\0';
			LineStreamClient client(fdb[0], fda[1]);
			close(fdb[1]);
			close(fda[0]);

			int r = 1;
			do
			{
				r = client.receiveFrame(buffer,sizeof(buffer));
				// Slow down.
				usleep(800000);
				
				printf("CLIENT received (%d bytes) : ",r);
				int i;
				for(i=0; i<r; i++)
				{
					printf("%02X ", buffer[i]);
				}
				printf("\n");

			}
			while (r>0);
		}
		exit(-1);
	default:
		break;
	}
	
	/* Close other ends of pipe */
	close(fda[1]);
	close(fdb[0]);

    pthread_t receiverThreadID, transmitterThreadID;

	server->open();

	pthread_create(&receiverThreadID,NULL,&receiverThread, (void*)server);
	pthread_create(&transmitterThreadID,NULL,&transmitterThread, (void*)server);

	waitpid(-1,&ret,0);

    delete (server) ;
}

/*
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
*/


