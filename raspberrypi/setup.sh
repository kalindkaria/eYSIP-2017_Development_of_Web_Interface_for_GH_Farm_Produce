#!/bin/sh/
cd /
mkdir /home/pi/ghfarm/
cat client.py >> /home/pi/ghfarm/client.py
cat ghfarm.py >> /home/pi/ghfarm/ghfarm.py
sudo apt-get install -y python3 python3-pip python3-rpi.gpio fswebcam tmux
sudo pip3 install requests
crontab -l >> mycron
echo '@reboot tmux new-session -d -s "ghfarm" "python3 /home/pi/ghfarm/ghfarm.py"'>> mycron
echo '@reboot python3 /home/pi/ghfarm/client.py'>> mycron
echo '*/5 * * * * python3 /home/pi/ghfarm/client.py'>> mycron
crontab mycron
rm mycron
echo "Done with the setup"
