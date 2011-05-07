include ../Common.mak
libcore.a: start.o context.o crt-c.o
	$(AR) $(ARFLAGS) $@ $+
start.o: start.S
context.o: context.S
crt-c.o: crt-c.c
clean:
	-rm start.o context.o crt-c.o libcore.a 2> /dev/null
EXTRACFLAGS+=-I$(PWD)/..
include $(ARDUINO_DIR)/hardware/zpuino/cores/zpuino/Rules.mak
