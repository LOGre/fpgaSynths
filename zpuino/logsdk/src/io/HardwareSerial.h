#include <zpuino.h>
#include <zpuino-types.h>
#include "Stream.h"

class HardwareSerial: public Stream
{
private:
public:
	HardwareSerial(unsigned int b): ioslot(IO_SLOT(b)) {}

	__attribute__((always_inline)) inline void begin(const unsigned int baudrate) {
		if (__builtin_constant_p(baudrate)) {
			REGISTER(ioslot,1) = BAUDRATEGEN(baudrate) | BIT(UARTEN);
		} else {
			begin_slow(baudrate);
		}
	}
	void begin_slow(const unsigned int baudrate);

	int available(void) {
		return (REGISTER(ioslot,1) & 1);
	}

	int read(void) {
		return REGISTER(ioslot,0);
	}

	virtual void flush(void) {};

	void write(uint8_t c);

	using Print::write; // pull in write(str) and write(buf, size) from Print
private:
	unsigned int ioslot;
};


extern HardwareSerial Serial; /* 1st slot */

