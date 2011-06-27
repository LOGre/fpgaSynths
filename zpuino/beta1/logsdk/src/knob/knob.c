#include <zpuino.h>
#include <knob.h>

enum {
	ROT_IDLE,
	ROT_EVENT_RIGHT1,
	ROT_EVENT_RIGHT2,
	ROT_EVENT_RIGHT3,
	ROT_EVENT_LEFT1,
	ROT_EVENT_LEFT2,
	ROT_EVENT_LEFT3
} knob_state = ROT_IDLE;

/* Debounce registers */
static uint32_t debounce_a, debounce_b, debounce_center;
#define ROT_RISING_A ((debounce_a&0x3) == 0x1)
#define ROT_RISING_B ((debounce_b&0x3) == 0x1)

#define ROT_FALLING_A ((debounce_a&0x3) == 0x2)
#define ROT_FALLING_B ((debounce_b&0x3) == 0x2)

// Should be called from a 1KHz interrupt
int knob_readEncoder()
{
	switch(knob_state) {
	case ROT_IDLE:
		if (ROT_FALLING_A) {
			knob_state = ROT_EVENT_RIGHT1;
			break;
		}
		if (ROT_FALLING_B) {
			knob_state = ROT_EVENT_LEFT1;
			break;
		}
		break;

	case ROT_EVENT_RIGHT1:
		if (ROT_FALLING_B) {
			knob_state = ROT_EVENT_RIGHT2;
		}
		break;

	case ROT_EVENT_LEFT1:
		if (ROT_FALLING_A) {
			knob_state = ROT_EVENT_LEFT2;
		}
		break;

	case ROT_EVENT_RIGHT2:
		if (ROT_RISING_A) {
			knob_state = ROT_EVENT_RIGHT3;
		}
		break;

	case ROT_EVENT_LEFT2:
		if (ROT_RISING_B) {
			knob_state = ROT_EVENT_LEFT3;
		}
		break;

	case ROT_EVENT_RIGHT3:
		if (ROT_RISING_B) {
			knob_state = ROT_IDLE;
			return 1;
		}
		break;
	case ROT_EVENT_LEFT3:
		if (ROT_RISING_A) {
			knob_state = ROT_IDLE;
			return -1;
		}
		break;
	}
	return 0;
}

// Should be called from a 1KHz interrupt
void knob_debounce()
{
	// Debounce inputs
	debounce_a <<= 1;
	debounce_a|=digitalRead(ROT_A);
	debounce_b <<= 1;
	debounce_b|=digitalRead(ROT_B);
	
}

int knob_isPushed()
{
	return digitalRead(ROT_CENTER);
}

