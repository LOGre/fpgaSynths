CROSS=zpu-elf-

CC=$(CROSS)gcc
CXX=$(CROSS)g++
AR=$(CROSS)ar
OBJCOPY=$(CROSS)objcopy
SIZE=$(CROSS)size

EXTRACFLAGS+=$(PREFS___board___build___extraCflags)

CFLAGS=$(EXTRACFLAGS) -DZPU -Wall -Os -ffunction-sections -fdata-sections -nostartfiles -mmult -mdiv -mno-callpcrel -mno-pushspadd -mno-poppcrel -I$(COREPATH) -I$(ZPULOGSDK)/include
CXXFLAGS=$(CFLAGS) -fno-exceptions -fno-rtti
ARFLAGS=crs
LDFLAGS=-nostartfiles -Wl,-T -Wl,$(ZPULOGSDK)/lib/zpuino.lds $(ZPULOGSDK)/lib/libcore.a -Wl,--relax -Wl,--gc-sections

$(TARGET).elf: $(TARGETOBJ) $(LIBS)
	$(CC) -o $@ $(TARGETOBJ) $(LDFLAGS) -Wl,--whole-archive $(LIBS) -Wl,--no-whole-archive

all-target: $(TARGET).elf $(TARGET).bin $(TARGET).size

$(TARGET).bin: $(TARGET).elf
	$(OBJCOPY) -O binary $< $@

$(TARGET).hex: $(TARGET).elf
	$(OBJCOPY) -O ihex $< $@

$(TARGET).size: $(TARGET).hex
	$(SIZE) $< > $@
	
clean:
	-rm $(TARGETOBJ)
	
fclean: clean
	-rm $(TARGET).bin $(TARGET).elf $(TARGET).hex $(TARGET).size
