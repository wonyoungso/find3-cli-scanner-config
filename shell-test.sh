#!/bin/bash
ifconfig wlan0 down
ifconfig wlan1 down
echo "All Wifi is down"
# iwconfig wlan0 mode monitor

if iwconfig wlan0 mode monitor; then
	echo "wlan0 Success"
else
	echo "wlan0 failure"
fi

#iwconfig wlan1 mode monitor

if iwconfig wlan1 mode monitor; then
	echo "wlan1 Success"
else
	echo "wlan1 Failure"
fi


ifconfig wlan0 up
ifconfig wlan1 up


#bash
