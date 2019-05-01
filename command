sudo ifconfig wlan0 down
sudo ifconfig wlan1 down
sudo iwconfig wlan0 mode monitor
sudo iwconfig wlan1 mode monitor
sudo ifconfig wlan0 up
sudo ifconfig wlan1 up

docker run --net="host" --privileged --name scanner -d -i -t schollz/find3-cli-scanner 

docker run --net="host" --privileged --name scanner -d -i -t schollz/find3-cli-scanner find3-cli-scanner -wifi -bluetooth -server https://crowdsourcedcity-api.herokuapp.com -i wlan1 -passive -scantime 10 -forever -no-modify -device sarah -family family

#sarah
docker run scanner find3-cli-scanner -wifi -bluetooth -server https://crowdsourcedcity-api.herokuapp.com -i wlan0 -passive -scantime 10 -forever -no-modify -device sarah -family family

#dylan
docker exec scanner find3-cli-scanner -wifi -bluetooth -server https://crowdsourcedcity-api.herokuapp.com -i wlan0 -passive -scantime 10 -forever -no-modify -device dylan -family family

#yuchen
docker exec scanner find3-cli-scanner -wifi -bluetooth -server https://crowdsourcedcity-api.herokuapp.com -i wlan0 -passive -scantime 10 -forever -no-modify -device yuchen -family family


docker exec scanner find3-cli-scanner -wifi -bluetooth -server https://crowdsourcedcity-api.herokuapp.com -i wlan0 -passive -scantime 10 -forever -no-modify -device sarah -family family

>>>>>>> 48c98f2e3a6b9193bcd4b526f2bb8cae895b73f0

