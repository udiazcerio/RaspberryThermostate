# RaspberryThermostate
Termostato para la raspberry pi

Meter en el crontaba las siguientes lineas: 
@reboot /opt/RaspberryThermostate/OnReboot.sh & 
*/1 * * * * /opt/RaspberryThermostate/Thermostat.sh &
