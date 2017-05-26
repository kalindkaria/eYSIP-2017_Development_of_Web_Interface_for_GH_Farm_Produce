#!/bin/sh/
mkdir /home/pi/ghfarm/
cat client.py >> /home/pi/ghfarm/client.py
cat manage.py >> /home/pi/ghfarm/manage.py
chmod +x /home/pi/ghfarm/client.py
chmod +x /home/pi/ghfarm/manage.py
sudo apt-get install -y python3 python3-rpi.gpio
echo '@reboot /home/pi/ghfarm/client.py' | sudo tee -a /etc/crontab
echo 'Done with the Setup!'
## Add tasks to crontab