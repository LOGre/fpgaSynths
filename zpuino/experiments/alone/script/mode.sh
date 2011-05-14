#!/usr/bin/env sh

PAPILIO_BINDIR=$HOME/install/bin

# upload zpuino bitstream
sudo $PAPILIO_BINDIR/papilioloader -vvv -f ../../../bit/papilio_250k_ym_x2.bit ;

# make the bootloader enter the programming mode
sudo  ~/repo/zpuino/arduino-0022-ZA4/hardware/tools/zpuinoprogrammer -vvv -R -d /dev/ttyUSB1 -r -s 115200;
