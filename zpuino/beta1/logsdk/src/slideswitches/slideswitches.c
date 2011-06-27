#include <zpuino.h>
#include <slideswitches.h>


// Should be called from a 1KHz interrupt
int sw_readState(sw_button_t button)
{
	if(button == SW_BUTTON_0)
		return digitalRead(SW_0);
	else if(button == SW_BUTTON_1)
		return digitalRead(SW_1);
	else if(button == SW_BUTTON_2)
		return digitalRead(SW_2);
	else if(button == SW_BUTTON_3)
		return digitalRead(SW_3);		
		
	return -1;
}


