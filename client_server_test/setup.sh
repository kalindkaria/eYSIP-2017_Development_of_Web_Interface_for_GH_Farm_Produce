#!/bin/sh/
mkdir /home/pi/ghfarm/
cat client.py >> /home/pi/ghfarm/client.py
chmod +x /home/pi/ghfarm/client.py
apt-get install -y python3
echo '@reboot /home/pi/ghfarm/client.py' | sudo tee -a /etc/crontab
echo 'Done with the Setup!'