PATH+=:/home/texane/repo/zpuino/toolchain/bin:/opt/Xilinx/12.3/ISE_DS/ISE/bin/lin
all: all-target
include $(PWD)/Common.mak
TARGET=main
core/libcore.a:
	$(MAKE) -C core libcore.a
TARGETOBJ=main.o
LIBS+=core/libcore.a
include /home/texane/repo/zpuino/arduino-0022-ZA4/hardware/zpuino/cores/zpuino/Rules.mak
