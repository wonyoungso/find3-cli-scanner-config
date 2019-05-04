#!/bin/sh

deviceName="dylan"

echo "turn on bluetooth"
systemctl start bluetooth

echo "System Started"
ifconfig wlan0 down
ifconfig wlan1 down
echo "All Wifi is down"
iwconfig wlan0 mode monitor
iwconfig wlan1 mode monitor
ifconfig wlan0 up
ifconfig wlan1 up
echo "Wifi is up"

monitorID="wlan1"
sleep 15
docker stop scanner
docker rm scanner
cmd="docker run --net=\"host\" --privileged --name scanner -d -i -t schollz/find3-cli-scanner find3-cli-scanner -wifi -bluetooth -server https://crowdsourcedcity-api.herokuapp.com -i ${monitorID} -passive -scantime 10 -forever -no-modify -device ${deviceName} -family family"


eval "$cmd"

#sh
