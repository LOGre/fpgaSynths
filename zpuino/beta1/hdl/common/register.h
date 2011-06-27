#ifndef __REGISTER_H__
#define __REGISTER_H__

#if defined( __ZPUINO_S3E_EVAL__ )
#include "board_s3e_eval.h"
#else
# if defined( __ZPUINO_PAPILIO_ONE__ )
#  include "board_papilio_one.h"
# else
#  error Unknown board.
# endif
#endif

#define SPIISBLOCKING 1

typedef volatile unsigned int* register_t;

#define BIT(x) (1<<x)

#define IO_SLOT(x) (IOBASE + (x<<IO_SLOT_OFFSET_BIT))

#define REGISTER(SLOT, y) *(volatile unsigned int*)(SLOT + (y<<2))

#define SPIBASE  IO_SLOT(0)
#define UARTBASE IO_SLOT(1)
#define GPIOBASE IO_SLOT(2)
#define TIMERSBASE IO_SLOT(3)
#define INTRBASE IO_SLOT(4)
#define SIGMADELTABASE IO_SLOT(5)
#define USERSPIBASE IO_SLOT(6)
#define CRC16BASE IO_SLOT(7)


#define UARTDATA REGISTER(UARTBASE,0)
#define UARTCTL  REGISTER(UARTBASE,1)
#define UARTSTATUS  REGISTER(UARTBASE,2)

#define SPICTL  REGISTER(SPIBASE,0)
#define SPIDATA REGISTER(SPIBASE,1)

#define GPIODATA(x)  REGISTER(GPIOBASE,x)
#define GPIOTRIS(x)  REGISTER(GPIOBASE,4+x)
#define GPIOPPSMODE(x)  REGISTER(GPIOBASE,8+x)

#define GPIOPPSOUT(x)  REGISTER(GPIOBASE,(128 + x))
#define GPIOPPSIN(x)  REGISTER(GPIOBASE,(256 + x))

#define TMR0CTL  REGISTER(TIMERSBASE,0)
#define TMR0CNT  REGISTER(TIMERSBASE,1)
#define TMR0CMP  REGISTER(TIMERSBASE,2)
#define TIMERTSC REGISTER(TIMERSBASE,3)
#define TMR0OCR  REGISTER(TIMERSBASE,3) /* Same as TSC */
#define TMR1CTL  REGISTER(TIMERSBASE,4)
#define TMR1CNT  REGISTER(TIMERSBASE,5)
#define TMR1CMP  REGISTER(TIMERSBASE,6)
#define TMR1OCR  REGISTER(TIMERSBASE,7)

#define INTRCTL  REGISTER(INTRBASE,0)
#define INTRMASK  REGISTER(INTRBASE,1)
#define INTRLEVEL  REGISTER(INTRBASE,2)

#define SIGMADELTACTL   REGISTER(SIGMADELTABASE,0)
#define SIGMADELTADATA  REGISTER(SIGMADELTABASE,1)

#define USPICTL  REGISTER(USERSPIBASE,0)
#define USPIDATA REGISTER(USERSPIBASE,1)

#define CRC16ACC  REGISTER(CRC16BASE,0)
#define CRC16POLY REGISTER(CRC16BASE,1)
#define CRC16APP  REGISTER(CRC16BASE,2)
#define CRC16AM1  REGISTER(CRC16BASE,4)
#define CRC16AM2  REGISTER(CRC16BASE,5)

#define UARTEN 16 /* Uart enable */

/* Timer CTL bits */

#define TCTLENA 0 /* Timer Enable */
#define TCTLCCM 1 /* Clear on Compare Match */
#define TCTLDIR 2 /* Direction */
#define TCTLIEN 3 /* Interrupt enable */
#define TCTLCP0 4 /* Clock prescaler bit 0 */
#define TCTLCP1 5 /* Clock prescaler bit 1 */
#define TCTLCP2 6 /* Clock prescaler bit 2 */
#define TCTLIF  7 /* Interrupt flag */
#define TCTLOCE 8 /* Output compare enable */

/* SPI bits */
#define SPIREADY 0 /* SPI ready */
#define SPICP0   1 /* Clock prescaler bit 0 */
#define SPICP1   2 /* Clock prescaler bit 1 */
#define SPICP2   3 /* Clock prescaler bit 2 */
#define SPICPOL  4 /* Clock polarity */
#define SPISRE   5 /* Sample on Rising Edge */
#define SPIEN    6 /* SPI Enabled (gpio acquire) */
#define SPIBLOCK 7
#define SPITS0   8
#define SPITS1   9

/* Sigma-Delta bits */
#define SDENA0    0 /* Sigma-delta enable */
#define SDENA1    1
#define SDLE      2 /* Little-endian */

/* Baud rate computation */

#define BAUDRATEGEN(x) ((CLK_FREQ/(x))/16)-1

#define INPUT 1
#define OUTPUT 0

#define HIGH 1
#define LOW 0

/* PPS configuration */

#define IOPIN_SPI_MISO    0
#define IOPIN_SPI_MOSI    1
#define IOPIN_SPI_SCK     2
#define IOPIN_SIGMADELTA0 3
#define IOPIN_TIMER0_OC   4
#define IOPIN_TIMER1_OC   5
#define IOPIN_USPI_MISO   6
#define IOPIN_USPI_MOSI   7
#define IOPIN_USPI_SCK    8
#define IOPIN_SIGMADELTA1 13

/* Current interrupts (might not be implemented) */

#define INTRLINE_TIMER0 3
#define INTRLINE_TIMER1 4
#define INTRLINE_EXT1 16
#define INTRLINE_EXT2 17

#endif
