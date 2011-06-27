#include <zpuino.h>
#include <pushbuttons.h>


// Should be called from a 1KHz interrupt
int pb_readState(pb_button_t button)
{
	if(button == PB_NORTH)
		return digitalRead(BUT_NORTH);
	else if(button == PB_EAST)
		return digitalRead(BUT_EAST);
	else if(button == PB_WEST)
		return digitalRead(BUT_WEST);	
		
	return -1;
}
