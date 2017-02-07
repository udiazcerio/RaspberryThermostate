#!/bin/bash
###########################################################################
### References:
### I/O Control:
### http://www.instructables.com/id/Control-Stuff-with-your-Raspberry-Pi-GPIO/?ALLSTEPS
### http://www.raspberrypi.org/forums/viewtopic.php?p=131069&sid=88282aaa50634ad7db83c3965625c033#p131069
###
### bash if/then
### http://www.thegeekstuff.com/2010/06/bash-if-statement-examples/
### http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-6.html
### http://www.dreamsyssoft.com/unix-shell-scripting/ifelse-tutorial.php
###
### bash sleep ()
### http://www.cyberciti.biz/faq/linux-unix-sleep-bash-scripting/
###########################################################################
#
SoCTemp="`sudo /opt/vc/bin/vcgencmd measure_temp | tr -d "=temp.'C"`"
SoCTemp=46 # Enable this line for debugging
LowLimit=40
HighLimit=45
#
echo "Low Limit :"$LowLimit
echo "High Limit:"$HighLimit
echo "SoC Temp  :"$SoCTemp
## echo "1" > /sys/class/gpio/gpio17/value
###########################################################################
if [ $SoCTemp -le $HighLimit ]; then
   ### Turn on GPIO 17 off:
   echo "SoC is cool($SoCTemp), Turning off the fan in 20 seconds ..."
   sleep 20 ; echo "0" > /sys/class/gpio/gpio17/value
   echo "Done!"
   exit 0
fi
if [ $SoCTemp -ge $LowLimit ]; then
   ### Turn on GPIO 17 on:
   echo "SoC is getting hot ($SoCTemp), Turning on the fan now!"
   echo "1" > /sys/class/gpio/gpio17/value
   echo "Done!"
   exit 0
fi
