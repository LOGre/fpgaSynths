	.file	"boot.cpp"
	.globl	bdata
	.section	.rodata,"aw",@progbits
	.balign 4;
	.type	bdata, @object
	.size	bdata, 4
bdata:
	.zero	4
	.globl	ZPU_ID
	.section	.bss.ZPU_ID,"aw",@nobits
	.balign 4;
	.type	ZPU_ID, @object
	.size	ZPU_ID, 4
ZPU_ID:
	.zero	4
	.section	.bss.buffer,"aw",@nobits
	.balign 4;
	.type	buffer, @object
	.size	buffer, 288
buffer:
	.zero	288
	.section	.bss.unescaping,"aw",@nobits
	.balign 4;
	.type	unescaping, @object
	.size	unescaping, 4
unescaping:
	.zero	4
	.section	.bss.syncSeen,"aw",@nobits
	.balign 4;
	.type	syncSeen, @object
	.size	syncSeen, 4
syncSeen:
	.zero	4
	.section	.bss.bufferpos,"aw",@nobits
	.balign 4;
	.type	bufferpos, @object
	.size	bufferpos, 4
bufferpos:
	.zero	4
	.section	.bss.milisseconds,"aw",@nobits
	.balign 4;
	.type	milisseconds, @object
	.size	milisseconds, 4
milisseconds:
	.zero	4
	.section	.bss.inprogrammode,"aw",@nobits
	.balign 4;
	.type	inprogrammode, @object
	.size	inprogrammode, 4
inprogrammode:
	.zero	4
	.section	.rodata.handlers,"a",@progbits
	.balign 4;
	.type	handlers, @object
	.size	handlers, 40
handlers:
	.long	_Z11cmd_versionv
	.long	_Z12cmd_identifyv
	.long	_Z13cmd_waitreadyv
	.long	_Z20cmd_raw_send_receivev
	.long	_Z12cmd_enterpgmv
	.long	_Z12cmd_leavepgmv
	.long	_Z19cmd_sst_aai_programv
	.long	_Z16cmd_set_baudratev
	.long	_Z11cmd_progmemv
	.long	_Z9cmd_startv
	.section	.bss.flash_id,"aw",@nobits
	.balign 4;
	.type	flash_id, @object
	.size	flash_id, 4
flash_id:
	.zero	4
	.section	.rodata.vstring,"a",@progbits
	.balign 4;
	.type	vstring, @object
	.size	vstring, 16
vstring:
	.byte	1
	.byte	7
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	111
	.byte	-128
	.byte	5
	.byte	-72
	.byte	-40
	.byte	0
	.byte	-125
	.byte	1
	.byte	15
	.byte	0
	.section	.text._Z7outbytei,"ax",@progbits
	.globl	_Z7outbytei
	.type	_Z7outbytei, @function
_Z7outbytei:
	im 0
	pushspadd
	popsp
.L2:
	im 142606340
	load
	loadsp 0
	im 1
	lshiftright
	loadsp 0
	im 1
	and
	storesp 4
	storesp 4
	storesp 4
	loadsp 0
	impcrel .L2
	neqbranch
	loadsp 8
	im 142606336
	store
	im 2
	pushspadd
	popsp
	poppc
	.size	_Z7outbytei, .-_Z7outbytei
	.section	.text._Z8sendBytej,"ax",@progbits
	.globl	_Z8sendBytej
	.type	_Z8sendBytej, @function
_Z8sendBytej:
	im -2
	pushspadd
	popsp
	loadsp 16
	loadsp 0
	im 192937992
	store
	loadsp 0
	im 255
	and
	im -125
	addsp 4
	storesp 16
	storesp 4
	storesp 12
	loadsp 4
	im 1
	ulessthan
	impcrel .L6
	neqbranch
	im 125
	storesp 4
	im _Z7outbytei
	call
	loadsp 8
	im 32
	xor
	storesp 4
	impcrel .L8
	poppcrel
.L6:
	loadsp 8
	storesp 4
.L8:
	im _Z7outbytei
	call
	im 4
	pushspadd
	popsp
	poppc
	.size	_Z8sendBytej, .-_Z8sendBytej
	.section	.text._Z10sendBufferPKhj,"ax",@progbits
	.globl	_Z10sendBufferPKhj
	.type	_Z10sendBufferPKhj, @function
_Z10sendBufferPKhj:
	im -2
	pushspadd
	popsp
	loadsp 16
	im -1
	addsp 28
	storesp 12
	storesp 12
.L15:
	loadsp 4
	im -1
	eq
	impcrel .L14
	neqbranch
	loadsp 8
	loadsp 0
	im 1
	add
	storesp 16
	loadb
	storesp 4
	im _Z8sendBytej
	call
	im -1
	addsp 8
	storesp 8
	impcrel .L15
	poppcrel
.L14:
	im 4
	pushspadd
	popsp
	poppc
	.size	_Z10sendBufferPKhj, .-_Z10sendBufferPKhj
	.section	.text._Z11prepareSendv,"ax",@progbits
	.type	_Z11prepareSendv, @function
_Z11prepareSendv:
	im 0
	pushspadd
	popsp
	im 65535
	nop
	im 192937984
	store
	im 126
	storesp 4
	im _Z7outbytei
	call
	im 2
	pushspadd
	popsp
	poppc
	.size	_Z11prepareSendv, .-_Z11prepareSendv
	.section	.text._Z10finishSendv,"ax",@progbits
	.globl	_Z10finishSendv
	.type	_Z10finishSendv, @function
_Z10finishSendv:
	im -1
	pushspadd
	popsp
	im 192937984
	load
	loadsp 0
	im 8
	lshiftright
	storesp 8
	storesp 8
	im _Z8sendBytej
	call
	loadsp 4
	im 0xff
	and
	storesp 4
	im _Z8sendBytej
	call
	im 126
	storesp 4
	im _Z7outbytei
	call
	im 3
	pushspadd
	popsp
	poppc
	.size	_Z10finishSendv, .-_Z10finishSendv
	.section	.text._Z8spi_copyv,"ax",@progbits
	.globl	_Z8spi_copyv
	.type	_Z8spi_copyv, @function
_Z8spi_copyv:
#APP
	im 32760
popsp
im spi_copy_impl
poppc

#NO_APP
.L19:
	impcrel .L19
	poppcrel
	.size	_Z8spi_copyv, .-_Z8spi_copyv
	.section	.text._Z6inbytev,"ax",@progbits
	.globl	_Z6inbytev
	.type	_Z6inbytev, @function
_Z6inbytev:
	im -1
	pushspadd
	popsp
.L30:
	im 142606340
	load
	loadsp 0
	im 1
	and
	storesp 4
	storesp 4
	loadsp 0
	impcrel .L26
	neqbranch
	im inprogrammode
	load
	storesp 8
	loadsp 4
	impcrel .L30
	neqbranch
	im milisseconds
	load
	storesp 4
	im 1000
	loadsp 4
	ulessthanorequal
	impcrel .L30
	neqbranch
	loadsp 4
	im 167772160
	store
	loadsp 4
	im 159383552
	store
	im _Z8spi_copyv
	call
.L26:
	im 142606336
	load
	im _memreg+0
	store
	im 3
	pushspadd
	popsp
	poppc
	.size	_Z6inbytev, .-_Z6inbytev
	.section	.text._Z11enableTimerv,"ax",@progbits
	.globl	_Z11enableTimerv
	.type	_Z11enableTimerv, @function
_Z11enableTimerv:
	im 47999
	nop
	im 159383560
	store
	im 0
	nop
	im 159383556
	store
	im 31
	nop
	im 159383552
	store
	poppc
	.size	_Z11enableTimerv, .-_Z11enableTimerv
	.section	.text._Z11spi_disablev,"ax",@progbits
	.globl	_Z11spi_disablev
	.type	_Z11spi_disablev, @function
_Z11spi_disablev:
	im -1
	pushspadd
	popsp
	im 150994948
	loadsp 0
	load
	loadsp 0
	im 256
	or
	loadsp 8
	store
	storesp 8
	storesp 8
	im 3
	pushspadd
	popsp
	poppc
	.size	_Z11spi_disablev, .-_Z11spi_disablev
	.section	.text._Z10spi_enablev,"ax",@progbits
	.type	_Z10spi_enablev, @function
_Z10spi_enablev:
	im -1
	pushspadd
	popsp
	im 150994948
	loadsp 0
	load
	loadsp 0
	im -257
	and
	loadsp 8
	store
	storesp 8
	storesp 8
	im 3
	pushspadd
	popsp
	poppc
	.size	_Z10spi_enablev, .-_Z10spi_enablev
	.section	.text.printnibble,"ax",@progbits
	.globl	printnibble
	.type	printnibble, @function
printnibble:
	im -1
	pushspadd
	popsp
	loadsp 12
	im 15
	and
	storesp 8
	im 9
	loadsp 8
	ulessthanorequal
	impcrel .L49
	neqbranch
	im 87
	addsp 8
	storesp 4
	impcrel .L51
	poppcrel
.L49:
	im 48
	addsp 8
	storesp 4
.L51:
	im _Z7outbytei
	call
	im 3
	pushspadd
	popsp
	poppc
	.size	printnibble, .-printnibble
	.section	.text.printstring,"ax",@progbits
	.globl	printstring
	.type	printstring, @function
printstring:
	im -3
	pushspadd
	popsp
	loadsp 20
	storesp 16
.L58:
	loadsp 12
	loadb
	loadsp 0
	im 0xff
	and
	storesp 12
	storesp 12
	loadsp 4
	im 0
	eq
	impcrel .L57
	neqbranch
	loadsp 8
	im 0xff
	and
	storesp 4
	im _Z7outbytei
	call
	im 1
	addsp 16
	storesp 16
	impcrel .L58
	poppcrel
.L57:
	im 5
	pushspadd
	popsp
	poppc
	.size	printstring, .-printstring
	.section	.text.printhexbyte,"ax",@progbits
	.globl	printhexbyte
	.type	printhexbyte, @function
printhexbyte:
	im -1
	pushspadd
	popsp
	loadsp 12
	loadsp 0
	im 4
	lshiftright
	storesp 8
	storesp 8
	im printnibble
	call
	loadsp 4
	storesp 4
	im printnibble
	call
	im 3
	pushspadd
	popsp
	poppc
	.size	printhexbyte, .-printhexbyte
	.section	.text.printhex,"ax",@progbits
	.globl	printhex
	.type	printhex, @function
printhex:
	im -1
	pushspadd
	popsp
	loadsp 12
	loadsp 0
	im 24
	lshiftright
	storesp 8
	storesp 8
	im printhexbyte
	call
	loadsp 4
	im 16
	lshiftright
	storesp 4
	im printhexbyte
	call
	loadsp 4
	im 8
	lshiftright
	storesp 4
	im printhexbyte
	call
	loadsp 4
	storesp 4
	im printhexbyte
	call
	im 3
	pushspadd
	popsp
	poppc
	.size	printhex, .-printhex
	.section	.text.start,"ax",@progbits
	.globl	start
	.type	start, @function
start:
	im 4112
	nop
	im ivector
	store
	im bdata
	nop
	im bootloaderdata
	store
#APP
	im 32760
popsp
im __sketch_start
poppc

#NO_APP
.L62:
	impcrel .L62
	poppcrel
	.size	start, .-start
	.section	.rodata.str1.4,"aMS",@progbits,1
	.balign 4;
.LC0:
	.string	"CRC"
	.balign 4;
.LC1:
	.string	"BOARD "
	.balign 4;
.LC2:
	.string	" != "
	.section	.text.spi_copy_impl,"ax",@progbits
	.globl	spi_copy_impl
	.type	spi_copy_impl, @function
spi_copy_impl:
	im -5
	pushspadd
	popsp
	im 4096
	storesp 20
	im _Z10spi_enablev
	call
	im 11
	nop
	im 134217732
	store
	im 0
	nop
	im 134217732
	store
	im 0
	nop
	im 134217732
	store
	im 0
	nop
	im 134217732
	store
	im 0
	nop
	im 134217732
	store
	im 0
	nop
	im 134217732
	store
	im 0
	nop
	im 134217732
	store
	im 134217732
	load
	im 65535
	and
	storesp 16
	im 0
	nop
	im 134217732
	store
	im 0
	nop
	im 134217732
	store
	im 134217732
	load
	im 65535
	and
	storesp 24
	im 28544
	loadsp 16
	ulessthanorequal
	impcrel .L87
	neqbranch
.L88:
	impcrel .L88
	poppcrel
.L87:
	im 65535
	nop
	im 192937984
	store
	loadsp 12
	im 4
	mult
	im 4
	add
	im bdata
	store
.L113:
	im -1
	addsp 16
	storesp 16
	loadsp 12
	im -1
	eq
	impcrel .L110
	neqbranch
	im 4
	storesp 12
.L99:
	im 0
	nop
	im 134217732
	store
	im 134217732
	load
	im 192937992
	store
	im -1
	addsp 12
	storesp 12
	loadsp 8
	impcrel .L99
	neqbranch
	loadsp 16
	im 4
	addsp 24
	im 134217732
	load
	loadsp 8
	store
	storesp 24
	storesp 12
	impcrel .L113
	poppcrel
.L110:
	im _Z11spi_disablev
	call
	im 192937984
	load
	storesp 8
	loadsp 20
	loadsp 8
	eq
	impcrel .L103
	neqbranch
	im .LC0
	storesp 4
	im printstring
	call
.L104:
	impcrel .L104
	poppcrel
.L103:
	im 4100
	load
	storesp 8
	loadsp 4
	im -2097082624
	eq
	impcrel .L106
	neqbranch
	im .LC1
	storesp 4
	im printstring
	call
	im 4100
	load
	storesp 4
	im printhex
	call
	im .LC2
	storesp 4
	im printstring
	call
	im -2097082624
	storesp 4
	im printhex
	call
.L107:
	impcrel .L107
	poppcrel
.L106:
	im 134217728
	load
	loadsp 0
	im -65
	and
	im 134217728
	store
	storesp 8
	im start
	call
	.size	spi_copy_impl, .-spi_copy_impl
	.section	.text._zpu_interrupt,"ax",@progbits
	.globl	_zpu_interrupt
	.type	_zpu_interrupt, @function
_zpu_interrupt:
	im -1
	pushspadd
	popsp
	im milisseconds
	load
	im 1
	addsp 4
	im milisseconds
	store
	storesp 4
	im 159383552
	loadsp 0
	load
	loadsp 0
	im -129
	and
	loadsp 8
	store
	storesp 8
	storesp 8
	im 3
	pushspadd
	popsp
	poppc
	.size	_zpu_interrupt, .-_zpu_interrupt
	.section	.text._Z14is_atmel_flashv,"ax",@progbits
	.type	_Z14is_atmel_flashv, @function
_Z14is_atmel_flashv:
	im -1
	pushspadd
	popsp
	im 0
	nop
	im flash_id
	load
	im 16711680
	and
	storesp 8
	storesp 8
	loadsp 0
	im 2031616
	eq
	not
	im 1
	and
	impcrel .L116
	neqbranch
	im 1
	storesp 8
.L116:
	loadsp 4
	im _memreg+0
	store
	im 3
	pushspadd
	popsp
	poppc
	.size	_Z14is_atmel_flashv, .-_Z14is_atmel_flashv
	.section	.text._Z15spi_read_statusv,"ax",@progbits
	.type	_Z15spi_read_statusv, @function
_Z15spi_read_statusv:
	im 0
	pushspadd
	popsp
	im _Z10spi_enablev
	call
	im _Z14is_atmel_flashv
	call
	im _memreg+0
	load
	im 0
	eq
	impcrel .L118
	neqbranch
	im 87
	nop
	im 134217732
	store
	impcrel .L121
	poppcrel
.L118:
	im 5
	nop
	im 134217732
	store
.L121:
	im 0
	nop
	im 134217732
	store
	im 134217732
	load
	loadsp 0
	im 255
	and
	storesp 4
	storesp 4
	im _Z11spi_disablev
	call
	loadsp 0
	im _memreg+0
	store
	im 2
	pushspadd
	popsp
	poppc
	.size	_Z15spi_read_statusv, .-_Z15spi_read_statusv
	.section	.text._Z11cmd_progmemv,"ax",@progbits
	.type	_Z11cmd_progmemv, @function
_Z11cmd_progmemv:
	poppc
	.size	_Z11cmd_progmemv, .-_Z11cmd_progmemv
	.section	.text._Z20cmd_raw_send_receivev,"ax",@progbits
	.type	_Z20cmd_raw_send_receivev, @function
_Z20cmd_raw_send_receivev:
	im -3
	pushspadd
	popsp
	im _Z10spi_enablev
	call
	im buffer+1
	loadb
	im buffer+2
	loadb
	loadsp 4
	im 256
	mult
	add
	storesp 12
	storesp 12
	im 0
	loadsp 8
	ulessthanorequal
	impcrel .L149
	neqbranch
	im buffer+5
	loadsp 8
	storesp 16
	storesp 16
.L135:
	loadsp 12
	loadsp 0
	im 1
	add
	storesp 20
	loadb
	im 134217732
	store
	im -1
	addsp 12
	storesp 12
	loadsp 8
	impcrel .L135
	neqbranch
.L149:
	im buffer+3
	loadb
	im buffer+4
	loadb
	loadsp 4
	im 256
	mult
	add
	storesp 20
	storesp 8
	im 0
	storesp 12
.L154:
	loadsp 8
	loadsp 16
	ulessthanorequal
	impcrel .L151
	neqbranch
	im 0
	nop
	im 134217732
	store
	im 134217732
	load
	storesp 8
	loadsp 4
	im buffer
	addsp 16
	storeb
	im 1
	addsp 12
	storesp 12
	impcrel .L154
	poppcrel
.L151:
	im _Z11spi_disablev
	call
	im _Z11prepareSendv
	call
	im 132
	storesp 4
	im _Z8sendBytej
	call
	loadsp 12
	im 8
	lshiftright
	storesp 4
	im _Z8sendBytej
	call
	loadsp 12
	storesp 4
	im _Z8sendBytej
	call
	im 0
	storesp 12
.L155:
	loadsp 8
	loadsp 16
	ulessthanorequal
	impcrel .L153
	neqbranch
	im buffer
	addsp 12
	loadb
	storesp 4
	im _Z8sendBytej
	call
	im 1
	addsp 12
	storesp 12
	impcrel .L155
	poppcrel
.L153:
	im _Z10finishSendv
	call
	im 5
	pushspadd
	popsp
	poppc
	.size	_Z20cmd_raw_send_receivev, .-_Z20cmd_raw_send_receivev
	.section	.text._Z19cmd_sst_aai_programv,"ax",@progbits
	.type	_Z19cmd_sst_aai_programv, @function
_Z19cmd_sst_aai_programv:
	poppc
	.size	_Z19cmd_sst_aai_programv, .-_Z19cmd_sst_aai_programv
	.section	.text._Z11simpleReplyj,"ax",@progbits
	.type	_Z11simpleReplyj, @function
_Z11simpleReplyj:
	im 0
	pushspadd
	popsp
	im _Z11prepareSendv
	call
	loadsp 8
	im 128
	or
	storesp 4
	im _Z8sendBytej
	call
	im _Z10finishSendv
	call
	im 2
	pushspadd
	popsp
	poppc
	.size	_Z11simpleReplyj, .-_Z11simpleReplyj
	.section	.text._Z16cmd_set_baudratev,"ax",@progbits
	.type	_Z16cmd_set_baudratev, @function
_Z16cmd_set_baudratev:
	im -3
	pushspadd
	popsp
	im buffer+1
	loadb
	im buffer+2
	loadb
	loadsp 4
	im 16
	ashiftleft
	loadsp 4
	im 8
	ashiftleft
	or
	im buffer+3
	loadb
	loadsp 0
	loadsp 8
	or
	im 8
	ashiftleft
	im buffer+4
	loadb
	loadsp 4
	or
	storesp 4
	storesp 8
	storesp 12
	storesp 20
	storesp 20
	storesp 8
	im 8
	storesp 4
	im _Z11simpleReplyj
	call
	im 255
	storesp 4
	im _Z7outbytei
	call
.L159:
	im 142606340
	load
	loadsp 0
	im 1
	lshiftright
	loadsp 0
	im 1
	and
	storesp 4
	storesp 4
	storesp 8
	loadsp 4
	impcrel .L159
	neqbranch
	loadsp 8
	im 65536
	or
	im 142606340
	store
	im 5
	pushspadd
	popsp
	poppc
	.size	_Z16cmd_set_baudratev, .-_Z16cmd_set_baudratev
	.section	.text._Z13cmd_waitreadyv,"ax",@progbits
	.type	_Z13cmd_waitreadyv, @function
_Z13cmd_waitreadyv:
	im -2
	pushspadd
	popsp
	im _Z14is_atmel_flashv
	call
	im _memreg+0
	load
	im 0
	eq
	impcrel .L168
	neqbranch
.L164:
	im _Z15spi_read_statusv
	call
	im _memreg+0
	load
	im _memreg+0
	load
	im 7
	lshiftright
	im 1
	xor
	loadsp 0
	im 1
	and
	storesp 4
	storesp 12
	storesp 12
	loadsp 4
	impcrel .L164
	neqbranch
	impcrel .L167
	poppcrel
.L168:
	im _Z15spi_read_statusv
	call
	im _memreg+0
	load
	im _memreg+0
	load
	im 1
	and
	storesp 12
	storesp 12
	loadsp 4
	impcrel .L168
	neqbranch
.L167:
	im _Z11prepareSendv
	call
	im 131
	storesp 4
	im _Z8sendBytej
	call
	loadsp 8
	storesp 4
	im _Z8sendBytej
	call
	im _Z10finishSendv
	call
	im 4
	pushspadd
	popsp
	poppc
	.size	_Z13cmd_waitreadyv, .-_Z13cmd_waitreadyv
	.section	.text._Z11cmd_versionv,"ax",@progbits
	.type	_Z11cmd_versionv, @function
_Z11cmd_versionv:
	im -1
	pushspadd
	popsp
	im 0
	nop
	im milisseconds
	store
	im _Z11prepareSendv
	call
	im 129
	storesp 4
	im _Z8sendBytej
	call
	im 16
	storesp 8
	im vstring
	storesp 4
	im _Z10sendBufferPKhj
	call
	im _Z10finishSendv
	call
	im 3
	pushspadd
	popsp
	poppc
	.size	_Z11cmd_versionv, .-_Z11cmd_versionv
	.section	.text._Z12cmd_identifyv,"ax",@progbits
	.type	_Z12cmd_identifyv, @function
_Z12cmd_identifyv:
	im -2
	pushspadd
	popsp
	im 0
	nop
	im milisseconds
	store
	im _Z11prepareSendv
	call
	im 130
	storesp 4
	im _Z8sendBytej
	call
	im _Z10spi_enablev
	call
	im 134217732
	storesp 8
	im 159
	loadsp 8
	store
	im 0
	loadsp 0
	loadsp 12
	store
	loadsp 0
	loadsp 12
	store
	loadsp 8
	store
	loadsp 4
	load
	storesp 8
	im _Z11spi_disablev
	call
	loadsp 4
	im flash_id
	store
	loadsp 4
	im 16
	lshiftright
	storesp 4
	im _Z8sendBytej
	call
	im flash_id
	load
	im 8
	lshiftright
	storesp 4
	im _Z8sendBytej
	call
	im flash_id
	load
	storesp 4
	im _Z8sendBytej
	call
	im _Z15spi_read_statusv
	call
	im _memreg+0
	load
	storesp 4
	im _Z8sendBytej
	call
	im _Z10finishSendv
	call
	im 4
	pushspadd
	popsp
	poppc
	.size	_Z12cmd_identifyv, .-_Z12cmd_identifyv
	.section	.text._Z12cmd_enterpgmv,"ax",@progbits
	.type	_Z12cmd_enterpgmv, @function
_Z12cmd_enterpgmv:
	im 0
	pushspadd
	popsp
	im 1
	nop
	im inprogrammode
	store
	im 0
	nop
	im 159383552
	store
	im 5
	storesp 4
	im _Z11simpleReplyj
	call
	im 2
	pushspadd
	popsp
	poppc
	.size	_Z12cmd_enterpgmv, .-_Z12cmd_enterpgmv
	.section	.text._Z12cmd_leavepgmv,"ax",@progbits
	.type	_Z12cmd_leavepgmv, @function
_Z12cmd_leavepgmv:
	im 0
	pushspadd
	popsp
	im 0
	nop
	im inprogrammode
	store
	im _Z11enableTimerv
	call
	im 6
	storesp 4
	im _Z11simpleReplyj
	call
	im 2
	pushspadd
	popsp
	poppc
	.size	_Z12cmd_leavepgmv, .-_Z12cmd_leavepgmv
	.section	.text._Z9cmd_startv,"ax",@progbits
	.globl	_Z9cmd_startv
	.type	_Z9cmd_startv, @function
_Z9cmd_startv:
	im 0
	pushspadd
	popsp
	im 10
	storesp 4
	im _Z11simpleReplyj
	call
	im start
	call
	.size	_Z9cmd_startv, .-_Z9cmd_startv
	.section	.text._Z14processCommandv,"ax",@progbits
	.globl	_Z14processCommandv
	.type	_Z14processCommandv, @function
_Z14processCommandv:
	im -2
	pushspadd
	popsp
	im 0
	nop
	im bufferpos
	load
	storesp 8
	storesp 8
	im 2
	loadsp 4
	ulessthanorequal
	impcrel .L187
	neqbranch
	im 65535
	nop
	im 192937984
	store
	im -2
	addsp 4
	storesp 12
.L197:
	loadsp 4
	loadsp 12
	ulessthanorequal
	impcrel .L196
	neqbranch
	im buffer
	addsp 8
	loadb
	im 192937992
	store
	im 1
	addsp 8
	storesp 8
	impcrel .L197
	poppcrel
.L196:
	im bufferpos
	load
	im -1
	add
	im bufferpos
	store
	im bufferpos
	load
	im buffer
	addsp 4
	loadb
	storesp 12
	im -1
	add
	im bufferpos
	store
	im bufferpos
	load
	im buffer
	add
	loadsp 0
	loadb
	loadsp 0
	im 8
	ashiftleft
	loadsp 16
	or
	im 192937984
	load
	storesp 8
	storesp 16
	storesp 4
	storesp 4
	loadsp 0
	loadsp 8
	eq
	not
	im 1
	and
	impcrel .L187
	neqbranch
	im buffer
	loadb
	storesp 8
	loadsp 4
	im 10
	ulessthan
	impcrel .L187
	neqbranch
	loadsp 4
	im 4
	mult
	im handlers-4
	add
	loadsp 0
	load
	storesp 4
	storesp 4
	loadsp 0
	call
.L187:
	im 4
	pushspadd
	popsp
	poppc
	.size	_Z14processCommandv, .-_Z14processCommandv
	.section	.text._Z14configure_pinsv,"ax",@progbits
	.globl	_Z14configure_pinsv
	.type	_Z14configure_pinsv, @function
_Z14configure_pinsv:
	im -3
	pushspadd
	popsp
	im 150994948
	storesp 8
	im -17
	loadsp 8
	load
	loadsp 0
	loadsp 8
	and
	loadsp 16
	store
	storesp 8
	loadsp 8
	load
	loadsp 0
	im 32
	or
	loadsp 16
	store
	storesp 8
	loadsp 8
	load
	loadsp 0
	im 64
	or
	loadsp 16
	store
	storesp 8
	loadsp 8
	load
	loadsp 0
	im 128
	or
	loadsp 16
	store
	storesp 8
	loadsp 8
	load
	loadsp 0
	im 256
	or
	loadsp 16
	store
	storesp 8
	storesp 16
	im 1
	nop
	im 150995468
	store
	im 2
	loadsp 0
	im 150995472
	store
	im 150995968
	store
	im 150994976
	loadsp 0
	load
	loadsp 0
	im 8
	or
	loadsp 8
	store
	storesp 8
	loadsp 0
	load
	loadsp 0
	im 16
	or
	loadsp 8
	store
	storesp 8
	storesp 8
	im 150994960
	loadsp 0
	load
	loadsp 0
	im -9
	and
	loadsp 8
	store
	storesp 8
	loadsp 0
	load
	loadsp 0
	loadsp 24
	and
	loadsp 8
	store
	storesp 8
	storesp 12
	im 150994964
	loadsp 0
	load
	loadsp 0
	im -257
	and
	loadsp 8
	store
	storesp 8
	loadsp 0
	load
	loadsp 0
	loadsp 24
	and
	loadsp 8
	store
	storesp 8
	loadsp 0
	load
	loadsp 0
	im -33
	and
	loadsp 8
	store
	storesp 8
	loadsp 0
	load
	loadsp 0
	im -65
	and
	loadsp 8
	store
	storesp 8
	loadsp 0
	load
	loadsp 0
	im -129
	and
	loadsp 8
	store
	storesp 8
	storesp 8
	loadsp 8
	load
	loadsp 0
	im -16777217
	and
	loadsp 16
	store
	storesp 4
	im 150994944
	loadsp 0
	load
	loadsp 0
	im 16777216
	or
	loadsp 8
	store
	storesp 8
	storesp 8
	im 5
	pushspadd
	popsp
	poppc
	.size	_Z14configure_pinsv, .-_Z14configure_pinsv
	.section	.text.main,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	im -1
	pushspadd
	popsp
	im 0
	nop
	im inprogrammode
	store
	im 0
	nop
	im milisseconds
	store
	im 0
	nop
	im bufferpos
	store
	im _zpu_interrupt
	nop
	im ivector
	store
	im _Z14configure_pinsv
	call
	im 65587
	nop
	im 142606340
	store
	im 8
	nop
	im 167772164
	store
	im 1
	nop
	im 167772160
	store
	im _Z11enableTimerv
	call
	im 33800
	nop
	im 192937988
	store
	im 244
	nop
	im 134217728
	store
	im _Z11spi_disablev
	call
	im _Z10spi_enablev
	call
	im 0
	nop
	im syncSeen
	store
	im 0
	nop
	im unescaping
	store
.L333:
	im _Z6inbytev
	call
	im _memreg+0
	load
	im syncSeen
	load
	storesp 8
	storesp 8
	loadsp 0
	im 0
	eq
	impcrel .L318
	neqbranch
	im _memreg+0
	load
	im 126
	eq
	not
	im 1
	and
	impcrel .L319
	neqbranch
	im bufferpos
	load
	im 0
	eq
	impcrel .L333
	neqbranch
	im 0
	nop
	im syncSeen
	store
	im _Z14processCommandv
	call
	impcrel .L333
	poppcrel
.L319:
	im _memreg+0
	load
	im 125
	eq
	not
	im 1
	and
	impcrel .L322
	neqbranch
	im 1
	nop
	im unescaping
	store
	impcrel .L333
	poppcrel
.L322:
	im bufferpos
	load
	storesp 4
	loadsp 0
	im 287
	ulessthan
	impcrel .L324
	neqbranch
	im unescaping
	load
	im 0
	eq
	impcrel .L325
	neqbranch
	im 0
	nop
	im unescaping
	store
	im _memreg+0
	load
	im 32
	xor
	storesp 8
.L325:
	loadsp 4
	im buffer
	addsp 8
	storeb
	im bufferpos
	load
	im 1
	add
	im bufferpos
	store
	impcrel .L333
	poppcrel
.L324:
	im 0
	nop
	im syncSeen
	store
	impcrel .L333
	poppcrel
.L318:
	im _memreg+0
	load
	im 126
	eq
	not
	im 1
	and
	impcrel .L333
	neqbranch
	loadsp 0
	im bufferpos
	store
	im 65535
	nop
	im 192937984
	store
	im 1
	nop
	im syncSeen
	store
	loadsp 0
	im unescaping
	store
	impcrel .L333
	poppcrel
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.2"
