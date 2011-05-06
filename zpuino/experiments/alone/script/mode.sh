#!/usr/bin/env sh

PAPILIO_BINDIR=$HOME/install/bin

# upload zpuino bitstream
# sudo $PAPILIO_BINDIR/papilioloader -vvv -f bit/papilio_one_routed.bit ;
sudo $PAPILIO_BINDIR/papilioloader -vvv -f bit/bar.bit ;
# sudo $PAPILIO_BINDIR/papilioloader -vvv -f bit/fu.bit ;

# make the bootloader enter the programming mode
sudo  ~/repo/zpuino/arduino-0022-ZA4/hardware/tools/zpuinoprogrammer -vvv -R -d /dev/ttyUSB1 -r -s 115200;
