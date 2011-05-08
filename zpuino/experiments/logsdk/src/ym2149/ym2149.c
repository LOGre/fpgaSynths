#include "ym2149.h"

void setDeviceSlot(unsigned int slot)
{
	device_slot = slot;
}

void setChannelFrequency(ym2149_channel_t channel, uint16_t frequency)
{
	YM2149_REG( (channel << 1) ) = (uint8_t)frequency;
	YM2149_REG( ((channel << 1) + 1) ) = ((uint8_t) (frequency >> 8)) & 0x0F;
}

void setChannelVolume(ym2149_channel_t channel, uint8_t volume)
{
	YM2149_REG( (YM2149_REG_LEVELBASE + channel) ) = volume;
}

void setNoiseFrequency(uint8_t frequency)
{
	YM2149_REG(YM2149_REG_NOISE) = frequency;	
}

void setChannelMixer(ym2149_channel_t channel, ym2149_mixerType_t type)
{
	if(type == YM2149_NOISE) 
		YM2149_REG(YM2149_REG_MIXER) = channel << 3;
	else 
		YM2149_REG(YM2149_REG_MIXER) = channel;
}

void setEnvelopeFrequency(uint16_t frequency)
{
	YM2149_REG(YM2149_REG_ENVELOPE_FINE) = (uint8_t)frequency;
	YM2149_REG(YM2149_REG_ENVELOPE_ROUGH) = ((uint8_t) (frequency >> 8)) & 0x0F;	
}

void setEnvelopeShape(ym2149_envelopeShape_t envelope)
{
	YM2149_REG(YM2149_REG_ENVELOPE_SHAPE) = envelope;
}
