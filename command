sudo ifconfig wlan0 down
sudo ifconfig wlan1 down
sudo iwconfig wlan0 mode monitor
sudo iwconfig wlan1 mode monitor
sudo ifconfig wlan0 up
sudo ifconfig wlan1 up

docker exec scanner find3-cli-scanner -wifi -bluetooth -server https://crowdsourcedcity-api.herokuapp.com -i wlan1 -passive -no-modify -scantime 10 -forever -no-modify -device sarah -family family
