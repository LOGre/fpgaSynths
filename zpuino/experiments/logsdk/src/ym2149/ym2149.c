#include "ym2149.h"

unsigned int device_slot;

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

void setChannelMixerTone(ym2149_channel_t channel, uint8_t val)
{
  YM2149_REG(YM2149_REG_MIXER) &= ~(1 << channel);
  YM2149_REG(YM2149_REG_MIXER) |= val << (unsigned int)channel;
}

void setChannelMixerNoise(ym2149_channel_t channel, uint8_t val)
{
  YM2149_REG(YM2149_REG_MIXER) &= ~(1 << ((unsigned int)channel + 3));
  YM2149_REG(YM2149_REG_MIXER) |= val << ((unsigned int)channel + 3);
}


void setChannelMixer(ym2149_channel_t channel, ym2149_mixerType_t type)
{
	if (type == YM2149_NOISE) 
	  setChannelMixerNoise(channel, 0);
	else 
	  setChannelMixerTone(channel, 0);
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
