#ifndef __YM2149_H__
#define __YM2149_H__

#define YM2149_BASE(s) IO_SLOT(s)
#define YM2149_REG(c,x) REGISTER(c,x)


typedef enum {YM2149_CH_A,YM2149_CH_B,YM2149_CH_C} ym2149_channel;
typedef enum {YM2149_NOISE, YM2149_TONE} ym2149_mixerType;
typedef enum {YM2149_VOLMANUAL, YM2149_VOLENVELOPE} ym2149_volumeType;
typedef enum {YM2149_ENV_0000, YM2149_ENV_0100, YM2149_ENV_1000, YM2149_ENV_1001, YM2149_ENV_1010, YM2149_ENV_1011, YM2149_ENV_1100, YM2149_ENV_1101, YM2149_ENV_1110, YM2149_ENV_1111} ym2149_envelopeShape;

void setDeviceSlot(unsigned int slot);

void setChannelFrequency(ym2149_channel channel, u_int16_t frequency);
void setChannelVolume(ym2149_channel channel, u_int8_t volume);
void setNoiseFrequency(u_int8_t frequency);
void setChannelMixer(ym2149_channel channel, ym2149_mixerType type);
void setEnvelopeFrequency(u_int16_t frequency);
void setEnvelopeShape(ym2149_envelopeShape envelope);

#endif /* __YM2149_H__ */
