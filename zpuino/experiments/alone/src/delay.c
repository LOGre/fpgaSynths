#include <delay.h>

void delayCycles(unsigned int cycles)
{
	unsigned int current = TIMERTSC;
	unsigned int next = current + cycles;
	/* This might overflow. We assume cycles is less than 2^30 */
	if (next<current) {
		while (TIMERTSC&0x80000000) {}    // Wait for timer to roll over
	}

	while (TIMERTSC<next) {}
}

unsigned int millis(void) {
    return TIMERTSC / clocksPerMilisecond;
}
unsigned int micros(void) {
    return TIMERTSC / clocksPerMicrosecond;
}
