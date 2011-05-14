#ifndef __YM2149_H__
#define __YM2149_H__

#include <zpuino-types.h>
#include <register.h>

#define YM2149_BASE IO_SLOT(device_slot)
#define YM2149_REG(x) REGISTER(YM2149_BASE,x)

#define YM2149_REG_LEVELBASE 		0x08
#define YM2149_REG_ENVELOPE_FINE 	0x0B
#define YM2149_REG_ENVELOPE_ROUGH 	0x0C
#define YM2149_REG_ENVELOPE_SHAPE 	0x0D
#define YM2149_REG_MIXER 			0x07
#define YM2149_REG_NOISE 			0x06


typedef enum ym2149_channel {YM2149_CH_A,YM2149_CH_B,YM2149_CH_C} ym2149_channel_t;
typedef enum ym2149_mixerType {YM2149_NOISE, YM2149_TONE} ym2149_mixerType_t;
typedef enum ym2149_volumeType {YM2149_VOLMANUAL, YM2149_VOLENVELOPE} ym2149_volumeType_t;
typedef enum ym2149_envelopeShape {YM2149_ENV_0000, YM2149_ENV_0100, YM2149_ENV_1000, YM2149_ENV_1001, YM2149_ENV_1010, YM2149_ENV_1011, YM2149_ENV_1100, YM2149_ENV_1101, YM2149_ENV_1110, YM2149_ENV_1111} ym2149_envelopeShape_t;

extern unsigned int device_slot;

void setDeviceSlot(unsigned int slot);

void setChannelFrequency(ym2149_channel_t channel, uint16_t frequency);
void setChannelVolume(ym2149_channel_t channel, uint8_t volume);
void setNoiseFrequency(uint8_t frequency);
void setChannelMixer(ym2149_channel_t channel, ym2149_mixerType_t type);
void setChannelMixerNoise(ym2149_channel_t channel, uint8_t);
void setChannelMixerTone(ym2149_channel_t channel, uint8_t);
void setEnvelopeFrequency(uint16_t frequency);
void setEnvelopeShape(ym2149_envelopeShape_t envelope);

#endif /* __YM2149_H__ */
