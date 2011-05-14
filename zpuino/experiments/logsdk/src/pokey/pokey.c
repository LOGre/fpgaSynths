#include "pokey.h"

void setDeviceSlot(unsigned int slot)
{
	device_slot = slot;
}

void setChannelPeriodMultiplier(pokey_channel_t channel, uint8_t multiplier)
{
	POKEY_REG( (channel << 1) ) = (uint8_t)multiplier;
}

void setChannelControl(pokey_channel_t channel, uint8_t controlData)
{
	POKEY_REG( ((channel << 1)+1) ) = (uint8_t)controlData;
}

void setAudioCtrl(uint8_t controlData)
{
	POKEY_REG( POKEY_REG_AUDIOCTRL ) = controlData;
}


