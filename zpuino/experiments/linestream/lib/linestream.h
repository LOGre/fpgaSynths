#ifndef __LINESTREAM_H__
#define __LINESTREAM_H__

#ifdef __linux__
void linestream_init(int fdr,int fdw);
#endif

int linestream_receiveFrame(unsigned char *dest, unsigned maxsize);

#endif // __LINESTREAM_H__ 
