#include <pokey.h>

unsigned int pokey_device_slot;

void pokey_setDeviceSlot(unsigned int slot)
{
	pokey_device_slot = slot;
}

void pokey_setChannelPeriodMultiplier(pokey_channel_t channel, uint8_t multiplier)
{
	POKEY_REG( (channel << 1) ) = (uint8_t)multiplier;
}

void pokey_setChannelControl(pokey_channel_t channel, uint8_t controlData)
{
	POKEY_REG( ((channel << 1)+1) ) = (uint8_t)controlData;
}

void pokey_setAudioCtrl(uint8_t controlData)
{
	POKEY_REG( POKEY_REG_AUDIOCTRL ) = controlData;
}

void pokey_setChannelVolume(pokey_channel_t channel, uint8_t volume)
{
	POKEY_REG( ((channel << 1)+1) ) &= ((uint8_t)(volume | 0xF0));
}

void pokey_setChannelDistortion(pokey_channel_t channel, uint8_t distortion)
{
	POKEY_REG( ((channel << 1)+1) ) &= ((uint8_t)(distortion | 0x8F));
}


