PATH+=:$(TOOLCHAIN_DIR)
TARGET=main
all: all-target
write: all
	(cd ../script && ./write.sh) ;
clean:
	(cd core && make clean)
	-rm main.o delay.o 2> /dev/null
fclean:	clean
	-rm $(TARGET).bin $(TARGET).elf $(TARGET).hex $(TARGET).size 2> /dev/null
include $(PWD)/Common.mak
core/libcore.a:
	$(MAKE) -C core libcore.a
TARGETOBJ=main.o delay.o ../../logsdk/src/ym2149/ym2149.o
LIBS+=core/libcore.a
include $(ARDUINO_DIR)/hardware/zpuino/cores/zpuino/Rules.mak
