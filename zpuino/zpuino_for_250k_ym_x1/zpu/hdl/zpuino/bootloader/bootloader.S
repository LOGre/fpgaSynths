	.file	"boot.cpp"
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
	.size	vstring, 12
vstring:
	.byte	1
	.byte	6
	.byte	4
	.byte	32
	.byte	0
	.byte	0
	.byte	47
	.byte	-128
	.byte	5
	.byte	-72
	.byte	-40
	.byte	0
	.section	.text._Z7outbytei,"ax",@progbits
	.globl	_Z7outbytei
	.type	_Z7outbytei, @function
_Z7outbytei:
	im 0
	pushspadd
	popsp
.L2:
	im 34820
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
	im 34816
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
	im 47112
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
	im 47104
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
	im 47104
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
	im 16376
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
	im 34820
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
	im 40960
	store
	loadsp 4
	im 38912
	store
	im _Z8spi_copyv
	call
.L26:
	im 34816
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
	im 38920
	store
	im 0
	nop
	im 38916
	store
	im 31
	nop
	im 38912
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
	im 36868
	loadsp 0
	load
	loadsp 0
	im 1048576
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
	im 36868
	loadsp 0
	load
	loadsp 0
	im -1048577
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
	im 4108
	nop
	im ivector
	store
#APP
	im 16376
popsp
im __sketch_start
poppc

#NO_APP
.L62:
	impcrel .L62
	poppcrel
	.size	start, .-start
	.section	.text.spi_copy_impl,"ax",@progbits
	.globl	spi_copy_impl
	.type	spi_copy_impl, @function
spi_copy_impl:
	im -4
	pushspadd
	popsp
	im 4096
	storesp 16
	im _Z10spi_enablev
	call
	im 11
	nop
	im 32772
	store
	im 4
	nop
	im 32772
	store
	im 1056
	nop
	im 32772
	store
	im 270336
	nop
	im 32772
	store
	im 0
	nop
	im 32772
	store
	im 0
	nop
	im 32772
	store
	im 0
	nop
	im 32772
	store
	im 32772
	load
	im 65535
	and
	storesp 12
	im 0
	nop
	im 32772
	store
	im 0
	nop
	im 32772
	store
	im 32772
	load
	im 65535
	and
	storesp 20
	im 12160
	loadsp 12
	ulessthanorequal
	impcrel .L87
	neqbranch
.L88:
	impcrel .L88
	poppcrel
.L87:
	im 65535
	nop
	im 47104
	store
.L110:
	im -1
	addsp 12
	storesp 12
	loadsp 8
	im -1
	eq
	impcrel .L107
	neqbranch
	im 4
	storesp 8
.L99:
	im 0
	nop
	im 32772
	store
	im 32772
	load
	im 47112
	store
	im -1
	addsp 8
	storesp 8
	loadsp 4
	impcrel .L99
	neqbranch
	loadsp 12
	im 4
	addsp 20
	im 32772
	load
	loadsp 8
	store
	storesp 20
	storesp 8
	impcrel .L110
	poppcrel
.L107:
	im _Z11spi_disablev
	call
	im 47104
	load
	storesp 4
	loadsp 16
	loadsp 4
	eq
	impcrel .L103
	neqbranch
.L104:
	impcrel .L104
	poppcrel
.L103:
	im 32768
	load
	loadsp 0
	im -65
	and
	im 32768
	store
	storesp 4
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
	im 38912
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
	impcrel .L113
	neqbranch
	im 1
	storesp 8
.L113:
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
	impcrel .L115
	neqbranch
	im 87
	nop
	im 32772
	store
	impcrel .L118
	poppcrel
.L115:
	im 5
	nop
	im 32772
	store
.L118:
	im 0
	nop
	im 32772
	store
	im 32772
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
	im -4
	pushspadd
	popsp
	im buffer+3
	loadb
	im buffer+4
	loadb
	loadsp 4
	im 256
	mult
	add
	im buffer+1
	loadb
	im buffer+2
	loadb
	loadsp 4
	im 256
	mult
	add
	storesp 28
	storesp 28
	storesp 16
	storesp 8
.L137:
	im -1
	addsp 12
	storesp 12
	loadsp 8
	im -1
	eq
	impcrel .L133
	neqbranch
.L136:
	im 34820
	load
	loadsp 0
	im 1
	and
	storesp 4
	storesp 8
	loadsp 4
	impcrel .L136
	neqbranch
	im 34816
	load
	storesp 8
	loadsp 4
	loadsp 16
	loadsp 0
	im 1
	add
	storesp 24
	storeb
	loadsp 4
	storesp 4
	im _Z7outbytei
	call
	impcrel .L137
	poppcrel
.L133:
	im start
	call
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
	impcrel .L158
	neqbranch
	im buffer+5
	loadsp 8
	storesp 16
	storesp 16
.L144:
	loadsp 12
	loadsp 0
	im 1
	add
	storesp 20
	loadb
	im 32772
	store
	im -1
	addsp 12
	storesp 12
	loadsp 8
	impcrel .L144
	neqbranch
.L158:
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
.L163:
	loadsp 8
	loadsp 16
	ulessthanorequal
	impcrel .L160
	neqbranch
	im 0
	nop
	im 32772
	store
	im 32772
	load
	storesp 8
	loadsp 4
	im buffer
	addsp 16
	storeb
	im 1
	addsp 12
	storesp 12
	impcrel .L163
	poppcrel
.L160:
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
.L164:
	loadsp 8
	loadsp 16
	ulessthanorequal
	impcrel .L162
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
	impcrel .L164
	poppcrel
.L162:
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
	im -4
	pushspadd
	popsp
	im _Z10spi_enablev
	call
	im 6
	nop
	im 32772
	store
	im _Z11spi_disablev
	call
	im _Z10spi_enablev
	call
	im 173
	nop
	im 32772
	store
	im buffer+1
	loadb
	im buffer+2
	loadb
	loadsp 4
	im 256
	mult
	add
	im buffer+3
	loadb
	im 32772
	store
	im buffer+4
	loadb
	im 32772
	store
	im buffer+5
	loadb
	im 32772
	store
	storesp 24
	storesp 8
	im 0
	storesp 16
	loadsp 12
	loadsp 20
	ulessthanorequal
	impcrel .L193
	neqbranch
	im buffer+7
	storesp 12
.L189:
	loadsp 12
	im 0
	eq
	impcrel .L179
	neqbranch
	im _Z10spi_enablev
	call
	im 173
	nop
	im 32772
	store
.L179:
	im -1
	addsp 12
	loadb
	im 32772
	store
	loadsp 8
	loadb
	im 32772
	store
	im _Z11spi_disablev
	call
.L186:
	im _Z15spi_read_statusv
	call
	im _memreg+0
	load
	im 1
	and
	storesp 8
	loadsp 4
	impcrel .L186
	neqbranch
	im 2
	addsp 16
	im 2
	addsp 16
	storesp 16
	storesp 16
	loadsp 16
	loadsp 16
	ulessthan
	impcrel .L189
	neqbranch
.L193:
	im _Z10spi_enablev
	call
	im 4
	nop
	im 32772
	store
	im _Z11spi_disablev
	call
	im _Z11prepareSendv
	call
	im 135
	storesp 4
	im _Z8sendBytej
	call
	im _Z10finishSendv
	call
	im 6
	pushspadd
	popsp
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
.L196:
	im 34820
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
	impcrel .L196
	neqbranch
	loadsp 8
	im 65536
	or
	im 34820
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
	impcrel .L205
	neqbranch
.L201:
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
	impcrel .L201
	neqbranch
	impcrel .L204
	poppcrel
.L205:
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
	impcrel .L205
	neqbranch
.L204:
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
	im 12
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
	im 32772
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
	im 38912
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
	impcrel .L224
	neqbranch
	im 65535
	nop
	im 47104
	store
	im -2
	addsp 4
	storesp 12
.L234:
	loadsp 4
	loadsp 12
	ulessthanorequal
	impcrel .L233
	neqbranch
	im buffer
	addsp 8
	loadb
	im 47112
	store
	im 1
	addsp 8
	storesp 8
	impcrel .L234
	poppcrel
.L233:
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
	im 47104
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
	impcrel .L224
	neqbranch
	im buffer
	loadb
	storesp 8
	loadsp 4
	im 10
	ulessthan
	impcrel .L224
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
.L224:
	im 4
	pushspadd
	popsp
	poppc
	.size	_Z14processCommandv, .-_Z14processCommandv
	.section	.text._Z14configure_pinsv,"ax",@progbits
	.globl	_Z14configure_pinsv
	.type	_Z14configure_pinsv, @function
_Z14configure_pinsv:
	im -4
	pushspadd
	popsp
	im 1
	loadsp 0
	im 37588
	store
	storesp 20
	im 2
	nop
	im 37580
	store
	im 49
	nop
	im 37888
	store
	im 36900
	loadsp 0
	load
	loadsp 0
	im 2097152
	or
	loadsp 8
	store
	storesp 8
	loadsp 0
	load
	loadsp 0
	im 524288
	or
	loadsp 8
	store
	storesp 8
	storesp 8
	im -1048577
	loadsp 8
	load
	loadsp 0
	loadsp 8
	and
	loadsp 16
	store
	storesp 8
	storesp 16
	im -2
	loadsp 8
	load
	loadsp 0
	loadsp 8
	and
	loadsp 16
	store
	storesp 8
	storesp 12
	im 36884
	loadsp 0
	load
	loadsp 0
	im -2097153
	and
	loadsp 8
	store
	storesp 8
	loadsp 0
	load
	loadsp 0
	im -524289
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
	loadsp 20
	and
	loadsp 8
	store
	storesp 8
	storesp 8
	im 36868
	loadsp 0
	load
	loadsp 0
	loadsp 28
	or
	loadsp 8
	store
	storesp 8
	storesp 8
	im 6
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
	im 34820
	store
	im 8
	nop
	im 40964
	store
	im 1
	nop
	im 40960
	store
	im _Z11enableTimerv
	call
	im 33800
	nop
	im 47108
	store
	im 242
	nop
	im 32768
	store
	im _Z11spi_disablev
	call
	im _Z10spi_enablev
	call
	im _Z10spi_enablev
	call
	im 4
	nop
	im 32772
	store
	im _Z11spi_disablev
	call
	im 0
	nop
	im syncSeen
	store
	im 0
	nop
	im unescaping
	store
.L323:
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
	impcrel .L308
	neqbranch
	im _memreg+0
	load
	im 126
	eq
	not
	im 1
	and
	impcrel .L309
	neqbranch
	im bufferpos
	load
	im 0
	eq
	impcrel .L323
	neqbranch
	im 0
	nop
	im syncSeen
	store
	im _Z14processCommandv
	call
	impcrel .L323
	poppcrel
.L309:
	im _memreg+0
	load
	im 125
	eq
	not
	im 1
	and
	impcrel .L312
	neqbranch
	im 1
	nop
	im unescaping
	store
	impcrel .L323
	poppcrel
.L312:
	im bufferpos
	load
	storesp 4
	loadsp 0
	im 287
	ulessthan
	impcrel .L314
	neqbranch
	im unescaping
	load
	im 0
	eq
	impcrel .L315
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
.L315:
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
	impcrel .L323
	poppcrel
.L314:
	im 0
	nop
	im syncSeen
	store
	impcrel .L323
	poppcrel
.L308:
	im _memreg+0
	load
	im 126
	eq
	not
	im 1
	and
	impcrel .L323
	neqbranch
	loadsp 0
	im bufferpos
	store
	im 65535
	nop
	im 47104
	store
	im 1
	nop
	im syncSeen
	store
	loadsp 0
	im unescaping
	store
	impcrel .L323
	poppcrel
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.2"
