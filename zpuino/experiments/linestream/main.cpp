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

//#define USEDEBUGPIPE

#ifdef USEDEBUGPIPE
//#include "LineStreamClient.h"
extern "C" {
#include "lib/linestream.h"
}
#endif

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

	while (!do_exit) 
	{
		try {
			LOG("Waiting for frame\n");
			Frame f = server->receiveFrame(-1);
			if (server->handleIfControlFrame(f)) 
			{
                /* Data frame */
			}
		} catch (...) {
			LOG("Exception getting frame\n");
		}

	}
	
	LOG("Exiting receiverThread\n");
	
	return NULL;
}


void *transmitterThread(void *arg)
{
	// file
	struct stat st1, st2;
    int fd1 = open("test.log", O_RDONLY);	
    //int fd2 = open("saint_505_2.log", O_RDONLY);	
	const uint8_t * addr1;
	//const uint8_t * addr2;
	size_t size, nwritten, saved_size;
	const uint8_t* saved_addr;
	
	// get server ptr
	LineStreamServer *server = (LineStreamServer*)arg;

	// map files
	fstat(fd1, &st1);
	//fstat(fd2, &st2);

	addr1 = (const uint8_t*)mmap(NULL, st1.st_size, PROT_READ, MAP_SHARED, fd1, 0);
	if (addr1 == MAP_FAILED) perror("mmap file 1");
	size = st1.st_size;
	
	//addr2 = (const uint8_t*)mmap(NULL, st2.st_size, PROT_READ, MAP_SHARED, fd2, 0);
	//if (addr2 == MAP_FAILED) perror("mmap file 2");

	saved_size = st1.st_size;
	saved_addr = addr1;


	int sent = 0;
	do {
		if ( server->canTransmit()) 
		{
			server->stream((const unsigned char*) addr1,28);	
			//server->stream((const unsigned char*) addr2,28);
			addr1 += 28;	
			//addr2 += 28;
			sent++;
		} 
		else 
		{
            LOG("TX is full...wait !!!\n");
			usleep(10000);
		}
	} 
	while (sent<saved_size/28);
	
	close(fd1);
	//close(fd2);
	
	LOG("Exiting transmitterThread\n");

	return 0;
}

int main()
{
	// file descriptors
	pid_t pid;
    int ret;

	serial_handle_t handle;
	static const serial_conf_t conf =
    {
		115200,
		8,
		SERIAL_PARITY_DISABLED,
		1
    };

	#ifdef USEDEBUGPIPE
	int fda[2], fdb[2];
	pipe(fda);
	pipe(fdb);
	LineStreamServer *server = new LineStreamServer(fda[0],fdb[1]);
	#else
	serial_open(&handle, "/dev/ttyUSB0");
	serial_set_conf(&handle, &conf);
	printf("/dev/ttyUSB0 is opened\n");
		
	LineStreamServer *server = new LineStreamServer(&handle);
	#endif

	#ifdef USEDEBUGPIPE
	switch (fork()) 
	{
		case 0:
		{
			unsigned char buffer[128];
			buffer[0] = '\0';
			//LineStreamClient client(fdb[0], fda[1]);
			linestream_init(fdb[0], fda[1]);
			
			close(fdb[1]);
			close(fda[0]);

			int r = 1;
			do
			{
				r = linestream_receiveFrame(buffer,sizeof(buffer));
				//r = client.receiveFrame(buffer,sizeof(buffer));
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
	#endif

    pthread_t receiverThreadID, transmitterThreadID;

	server->open();

	pthread_create(&receiverThreadID,NULL,&receiverThread, (void*)server);
	pthread_create(&transmitterThreadID,NULL,&transmitterThread, (void*)server);
	
	while(1);
	
	waitpid(-1,&ret,0);

	LOG("bye bye\n");

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


