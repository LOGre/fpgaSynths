CROSS=zpu-elf-

CC=$(CROSS)gcc
CXX=$(CROSS)g++
AR=$(CROSS)ar

EXTRACFLAGS+=$(PREFS___board___build___extraCflags)

CFLAGS=$(EXTRACFLAGS) -DZPU -Wall -Os -ffunction-sections -fdata-sections -nostartfiles -mmult -mdiv -mno-callpcrel -mno-pushspadd -mno-poppcrel -I$(COREPATH) -I$(ZPULOGSDK)/include
CXXFLAGS=$(CFLAGS) -fno-exceptions -fno-rtti
ARFLAGS=crs
#LDFLAGS=-nostartfiles -Wl,-T -Wl,$(ZPULOGSDK)/lib/zpuino.lds -Wl,--relax -Wl,--gc-sections

all-target: $(TARGET).a

$(TARGET).a: $(TARGETOBJ)
	$(AR) $(ARFLAGS) $(TARGETLIB) $@ $+
	
clean:
	-rm $(TARGETOBJ)
	
