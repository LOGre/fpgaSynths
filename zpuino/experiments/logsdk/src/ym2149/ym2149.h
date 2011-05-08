#ifndef __YM2149_H__
#define __YM2149_H__

#include <zpuino-types.h>


#define YM2149_BASE(s) IO_SLOT(s)
#define YM2149_REG(c,x) REGISTER(c,x)


typedef enum ym2149_channel {YM2149_CH_A,YM2149_CH_B,YM2149_CH_C} ym2149_channel_t;
typedef enum ym2149_mixerType {YM2149_NOISE, YM2149_TONE} ym2149_mixerType_t;
typedef enum ym2149_volumeType {YM2149_VOLMANUAL, YM2149_VOLENVELOPE} ym2149_volumeType_t;
typedef enum ym2149_envelopeShape {YM2149_ENV_0000, YM2149_ENV_0100, YM2149_ENV_1000, YM2149_ENV_1001, YM2149_ENV_1010, YM2149_ENV_1011, YM2149_ENV_1100, YM2149_ENV_1101, YM2149_ENV_1110, YM2149_ENV_1111} ym2149_envelopeShape_t;

void setDeviceSlot(unsigned int slot);

void setChannelFrequency(ym2149_channel_t channel, uint16_t frequency);
void setChannelVolume(ym2149_channel_t channel, uint8_t volume);
void setNoiseFrequency(uint8_t frequency);
void setChannelMixer(ym2149_channel_t channel, ym2149_mixerType_t type);
void setEnvelopeFrequency(uint16_t frequency);
void setEnvelopeShape(ym2149_envelopeShape_t envelope);

#endif /* __YM2149_H__ */
