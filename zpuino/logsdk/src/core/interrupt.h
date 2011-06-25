#ifndef __ZPUINO_INTERRUPT_H__
#define __ZPUINO_INTERRUPT_H__

#include "register.h"

static __attribute__((always_inline)) inline void sei()
{
	INTRCTL=1;
}

static __attribute__((always_inline)) inline void cli()
{
	INTRCTL=0;

}
#endif
