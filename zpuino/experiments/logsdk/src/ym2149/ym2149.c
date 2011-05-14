#include "ym2149.h"

unsigned int ym2149_device_slot;

void ym2149_setDeviceSlot(unsigned int slot)
{
	ym2149_device_slot = slot;
}

void ym2149_setChannelFrequency(ym2149_channel_t channel, uint16_t frequency)
{
	YM2149_REG( (channel << 1) ) = (uint8_t)frequency;
	YM2149_REG( ((channel << 1) + 1) ) = ((uint8_t) (frequency >> 8)) & 0x0F;
}

void ym2149_setChannelVolume(ym2149_channel_t channel, uint8_t volume)
{
	YM2149_REG( (YM2149_REG_LEVELBASE + channel) ) = volume;
}

void ym2149_setNoiseFrequency(uint8_t frequency)
{
	YM2149_REG(YM2149_REG_NOISE) = frequency;	
}

void ym2149_setChannelMixerTone(ym2149_channel_t channel, uint8_t val)
{
  YM2149_REG(YM2149_REG_MIXER) &= ~(1 << channel);
  YM2149_REG(YM2149_REG_MIXER) |= val << (unsigned int)channel;
}

void ym2149_setChannelMixerNoise(ym2149_channel_t channel, uint8_t val)
{
  YM2149_REG(YM2149_REG_MIXER) &= ~(1 << ((unsigned int)channel + 3));
  YM2149_REG(YM2149_REG_MIXER) |= val << ((unsigned int)channel + 3);
}


void ym2149_setChannelMixer(ym2149_channel_t channel, ym2149_mixerType_t type)
{
	if (type == YM2149_NOISE) 
	  ym2149_setChannelMixerNoise(channel, 0);
	else 
	  ym2149_setChannelMixerTone(channel, 0);
}

void ym2149_setEnvelopeFrequency(uint16_t frequency)
{
	YM2149_REG(YM2149_REG_ENVELOPE_FINE) = (uint8_t)frequency;
	YM2149_REG(YM2149_REG_ENVELOPE_ROUGH) = ((uint8_t) (frequency >> 8)) & 0x0F;	
}

void ym2149_setEnvelopeShape(ym2149_envelopeShape_t envelope)
{
	YM2149_REG(YM2149_REG_ENVELOPE_SHAPE) = envelope;
}
