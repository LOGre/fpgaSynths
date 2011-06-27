#ifndef __POKEY_H__
#define __POKEY_H__

#include <zpuino-types.h>
#include <register.h>

#define POKEY_BASE IO_SLOT(pokey_device_slot)
#define POKEY_REG(x) REGISTER(POKEY_BASE,x)

#define POKEY_REG_AUDIOCTRL 	0x08

typedef enum pokey_channel {POKEY_CH_A,POKEY_CH_B,POKEY_CH_C,POKEY_CH_D} pokey_channel_t;


/*
 * 	void setDeviceSlot(unsigned int slot);
 * 
 *  Set Zpuino device slot for the given Pokey
 * 
 */ 
void pokey_setDeviceSlot(unsigned int slot);

/*
 * 	void setChannelPeriodMultiplier(pokey_channel_t channel, uint8_t multiplier);
 * 
 *	Audio channel period multiplier. (The mnemonic AUDio Frequency is a misnomer, although easier to
 * 	understand.) This register + 1 defines the number of pulses from the Pokey clock that will be counted
 *	before toggling the output of this channel from low to high or from high to low. In other words, this number
 * 	(+1) multiplied by the period of the Pokey clock in use gives half the period of the output waveform.
 *	For example, to determine the period multiplier for an A note (440 Hz by definition) using an input clock of
 *	64KHz, the formula is:
 *	63920 / 440 / 2 - 1 = 145.3 / 2 - 1 = 72.64 - 1 = 71.64
 * 	which means the closest we can get is 72 (actually 437.8 Hz).
 * 
 */
void pokey_setChannelPeriodMultiplier(pokey_channel_t channel, uint8_t multiplier);

/*
 * 	void setChannelControl(pokey_channel_t channel, uint8_t controlData);
 * 
 * 	The channel control register controls the noise content and
 * 	volume of the corresponding Audio Channel.
 *  
 *  Volume (D0-D3):
 * 		0000 : mute
 * 		1111 : highest volume
 * 
 * 	Distortion (D4-D7): 
 * 	The output waveform is masked by Pokey's polynomial (random) counters such that a low to
 *	high transition is only made if the polynomial output bit is 1. A high to low transition is always made. The
 *	counters used to mask the output are selected with the distortion bits as follows:
 *		0: 5-bit and 17-bit counters
 * 		1: 5-bit counter
 *		2: 5-bit and 4-bit counters
 *		3: 5-bit counter
 *		4: 17-bit counter
 *		5: none (pure tone)
 *		6: 4-bit counter
 *		7: none (pure tone)
 * 
 *	Volume Only (D7): 
 * 	If this bit is set, the AUDFn register and distortion bits are ignored. Instead, the output for
 *	this channel is kept at a flat level specified by the volume register.
 * 
 */
void pokey_setChannelControl(pokey_channel_t channel, uint8_t controlData);

/*
 * 	void setAudioCtrl(uint8_t controlData)
 * 
 * 	if set, the control bit:
 *		D0 change normal clock base from 64 kHz to 15 kHz
 *		D1 inserts high-pass filter into channel 2, clocked by chan 4
 *		D2 inserts high-pass filter into channel 1, clocked by chan 3 (see section 2)
 *		D3 clock channel 4 with channel 3, instead of 64 kHz (16-bit)
 *		D4 clock channel 2 with channel 1, instead of 64 kHz (16-bit)
 *		D5 clocks channel 3 with 1.79 MHz, instead of 64 kHz
 *		D6 clocks channel 1 with 1.79 MHz, instead of 64 kHz
 *		D7 makes the 17-bit poly counter into a 9-bit poly counter.
 * 
 *	Notes: 
 * 		9-bit Poly: If set, only 9 bits in the 17-bit polynomial counter are used, resulting in a shorter period of repetition.
 *		1.79MHz Ch.1: If set, channel 1 will be clocked by 1.790 MHz instead of the main clock. Also, the period counter is offset from the actual period by 4 instead of 1 (or 7 if using 16-bit counters).
 *		1.79MHz Ch.3: If set, channel 3 will be clocked by 1.790 MHz instead of the main clock. Also, the period counter is offset from the actual period by 4 instead of 1 (or 7 if using 16-bit counters).
 *		Join 1-2: If set, channels 1 and 2 will be joined into a single 16-bit period multiplier, with channel 1 as the	low byte and channel 2 as the high byte. This allows a much greater frequency range, and when used in
 *		conjunction with the 1.79MHz clock, give you more precision in output frequencies. For example, the A note can be defined as:
 *		1789772.5 / 440 / 2 - 7 = 4067.7 / 2 - 7 = 2033.8 - 7 = 2026.8
 *		So if we set it to 2027, the actual frequency will be 439.96, which is almost perfect!
 *		Join 3-4: If set, channels 3 and 4 will be joined into a single 16-bit period multiplier, with channel 3 as the	low byte and channel 4 as the high byte. This allows a much greater frequency range.
 *		High-pass 1-3: (Needs more research): If set, the channel 1 will only play if its period is less than that of channel 3.
 *		High-pass 2-4: (Needs more research): If set, the channel 2 will only play if its period is less than that of channel 4. 
 *
 */
void pokey_setAudioCtrl(uint8_t controlData);

/*
 * wrappers
 * 
 */ 
void pokey_setChannelVolume(pokey_channel_t channel, uint8_t volume);
void pokey_setChannelDistortion(pokey_channel_t channel, uint8_t distortion);

#endif /* __POKEY_H__ */
