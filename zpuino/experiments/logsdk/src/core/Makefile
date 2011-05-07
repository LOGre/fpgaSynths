include ../Common.mak
#libcore.a: start.o context.o crt-c.o Print.o delay.o HardwareSerial.o WString.o
libcore.a: start.o context.o crt-c.o delay.o
	$(AR) $(ARFLAGS) $@ $+
start.o: start.S
context.o: context.S
crt-c.o: crt-c.c
#Print.o: Print.cpp
delay.o: delay.c
#HardwareSerial.o: HardwareSerial.cpp
#WString.o: WString.cpp
EXTRACFLAGS+=-I$(PWD)/..
include /projects/ZPUino/IDE/arduino-0022-ZA4/hardware/zpuino/cores/zpuino/Rules.mak
