#!/bin/sh

deviceName="yuchen"

echo "turn on bluetooth"
systemctl start bluetooth

echo "System Started"
ifconfig wlan0 down
ifconfig wlan1 down
echo "All Wifi is down"
iwconfig wlan0 mode monitor | grep failed
if ($? -eq 0); then
	monitorID="wlan1"
else
	monitorID="wlan0"
fi
iwconfig wlan1 mode monitor
ifconfig wlan0 up
ifconfig wlan1 up

echo "monitorID is: $monitorID"

docker stop scanner
docker rm scanner
docker run --net="host" --privileged --name scanner -d -i -t schollz/find3-cli-scanner 

cmd="docker exec scanner find3-cli-scanner -wifi -bluetooth -server https://crowdsourcedcity-api.herokuapp.com -i ${monitorID} -passive -scantime 10 -forever -no-modify -device ${deviceName} -family family"

eval "$cmd"

#sh
