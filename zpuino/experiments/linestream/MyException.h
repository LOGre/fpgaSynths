#ifndef __MYEXCEPTION_H__
#define __MYEXCEPTION_H__

class MyException: public std::exception
{
public:
	MyException(const std::string &s): reason(s) {}
	~MyException() throw () {}

	virtual const char *what() const throw () { return reason.c_str(); }
private:
	std::string reason;
};

class ReadException: public MyException
{
public:
	ReadException(): MyException("read") {};
};

class FrameTooShortException: public MyException
{
public:
	FrameTooShortException(): MyException("short frame") {};
};

class BufferFullException: public MyException
{
public:
	BufferFullException(): MyException("buffer full") {};
};

class ChecksumErrorException: public MyException
{
public:
	ChecksumErrorException(): MyException("checksum error") {};
};

#endif /* __MYEXCEPTION_H__ */
