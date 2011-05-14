EXTRACFLAGS+=-I$(PWD)

TARGETOBJ = context.o crt-c.o delay.o start.o #Print.o HardwareSerial.o WString.o
TARGETLIB = libcore.a 
TARGETHEADER = board_papilio_one.h board_s3e_eval.h delay.h fixedptc.h interrupt.h WProgram.h zpuino.h endian.h inttypes.h register.h String.h zpuino-types.h #HardwareSerial.h WString.h Print.h Stream.h
	
include $(ZPULOGSDK)/lib/Papilio250K.mak
include $(ZPULOGSDK)/lib/LibRules.mak

