EXTRACFLAGS+=-I$(PWD)

TARGETOBJ = context.o crt-c.o delay.o start.o Print.o HardwareSerial.o WString.o
TARGETLIB = libcore.a 
TARGETHEADER = board_papilio_one.h delay.h fixedptc.h interrupt.h Print.h Stream.h WProgram.h zpuino.h board_s3e_eval.h endian.h HardwareSerial.h inttypes.h register.h String.h WString.h zpuino-types.h
	
include $(ZPULOGSDK)/lib/Papilio250K.mak
include $(ZPULOGSDK)/lib/LibRules.mak

