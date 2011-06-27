.section ".boots", "a"
	.globl __executable_start
        .globl _start
        .globl _premain
        .globl main
        .globl _end
        
/* ATTENTION - this requires a very strict memory map. Do not change before
   thinking */
.balign 4,0
	.globl ivector
        .globl bootloaderdata
ivector:
	.long 0x310AFADE /* Will be set by bootloader later. This is a sig. */
bootloaderdata:
	.long BOARD_ID
.balign 4,0	
__executable_start:
	im _premain
	poppc      
        
.balign 4,0
        .globl _Z14_zpu_interruptv

___zpu_interrupt_vector:
	im _memreg+0
        load
	im _Z14_zpu_interruptv
        call
        im _memreg+0
        store
        poppc
        

/* Other needed stuff */
	.globl _cpu_config

_cpu_config:
	.long 0
        .globl _init
        .weak _init
        .globl ___do_global_ctors
.text
        .globl _initIO
        .weak _initIO
_initIO:
	poppc
        .globl _Z14_zpu_interruptv
        .weak  _Z14_zpu_interruptv
_Z14_zpu_interruptv:
	poppc
        
        .weak _initIO
.section ".vectors"

	.org 0x0008
        .globl _memreg
_memreg:
