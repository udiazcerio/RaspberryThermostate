#!/bin/bash
###########################################################################
### References:
### I/O Control:
### http://www.instructables.com/id/Control-Stuff-with-your-Raspberry-Pi-GPIO/?ALLSTEPS
### http://www.raspberrypi.org/forums/viewtopic.php?p=131069&sid=88282aaa50634ad7db83c3965625c033#p131069
###
###########################################################################
### Replace with your correct GPIO number
for pin in 17 ; do
  gpio write $pin 0
  gpio export $pin out
done
exit 0
