#include <zpuino.h>
#include <knob.h>

static uint32_t debounce_a, debounce_b;

// Should be called from a 1KHz interrupt
int readKnobEncoder()
{
	switch(rotary_state) {
	case ROT_IDLE:
		if (ROT_FALLING_A) {
			rotary_state = ROT_EVENT_RIGHT1;
			break;
		}
		if (ROT_FALLING_B) {
			rotary_state = ROT_EVENT_LEFT1;
			break;
		}
		break;

	case ROT_EVENT_RIGHT1:
		if (ROT_FALLING_B) {
			rotary_state = ROT_EVENT_RIGHT2;
		}
		break;

	case ROT_EVENT_LEFT1:
		if (ROT_FALLING_A) {
			rotary_state = ROT_EVENT_LEFT2;
		}
		break;

	case ROT_EVENT_RIGHT2:
		if (ROT_RISING_A) {
			rotary_state = ROT_EVENT_RIGHT3;
		}
		break;

	case ROT_EVENT_LEFT2:
		if (ROT_RISING_B) {
			rotary_state = ROT_EVENT_LEFT3;
		}
		break;

	case ROT_EVENT_RIGHT3:
		if (ROT_RISING_B) {
			rotary_state = ROT_IDLE;
			return 1;
		}
		break;
	case ROT_EVENT_LEFT3:
		if (ROT_RISING_A) {
			rotary_state = ROT_IDLE;
			return -1;
		}
		break;
	}
	return 0;
}

// Should be called from a 1KHz interrupt
void debounceKnobs()
{
	// Debounce inputs
	debounce_a <<= 1;
	debounce_a|=digitalRead(ROT_A);
	debounce_b <<= 1;
	debounce_b|=digitalRead(ROT_B);
}

