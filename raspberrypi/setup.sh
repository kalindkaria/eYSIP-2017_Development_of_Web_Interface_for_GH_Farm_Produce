#!/bin/sh/
mkdir /home/pi/ghfarm/
cat client.py >> /home/pi/ghfarm/client.py
cat ghfarm.py >> /home/pi/ghfarm/ghfarm.py
chmod +x /home/pi/ghfarm/client.py
chmod +x /home/pi/ghfarm/ghfarm.py
sudo apt-get install -y python3 python3-rpi.gpio fswebcam
crontab -l >> mycron
echo '@reboot /home/pi/ghfarm/ghfarm.py'>> mycron
echo '@reboot /home/pi/ghfarm/client.py'>> mycron
echo '@hourly /home/pi/ghfarm/client.py'>> mycron
crontab mycron
rm mycron
echo "Done with the setup"
