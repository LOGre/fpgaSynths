#ifndef __DATAFRAME_H__
#define __DATAFRAME_H__

#include <string>

// This should hold the data buffer
class DataFrame: public std::string 
{
public:
	DataFrame(const unsigned char*d,unsigned size): std::string((char*)d,size) {}
	unsigned char *pointer() const { return (unsigned char*)c_str(); }
};

/* Simple HDLC frame */
struct Frame {
	unsigned int control;
	Frame(unsigned int ctrl, unsigned char *buf, unsigned size):
		control(ctrl) , data(buf,size) {
	}
	DataFrame data;
};

#endif /* __DATAFRAME_H__ */
