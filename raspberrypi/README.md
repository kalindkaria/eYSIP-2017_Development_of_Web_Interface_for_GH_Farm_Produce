## Raspberry Pi

---

This folder contains the various files required to setup the raspberry pi.

### Setting Up raspbery pi

Copy this entire folder and open a terminal in the folders location and type
```
sudo ./setup.sh
```
This will do the following:
* Copy the contents of this folder to `/home/pi/ghfarm/`.
* Install all the necessary files for raspberry pi.
* Setup crontask to run the `ghfarm.py` on reboot in a new tmux session with the name 'ghfarm'.
* Setup crontask to run `client.py` every 5 minutes.

### Connecting to raspberry pi

You can connect to the raspberry Pi via ssh.
For the initial system the user name and password was `pi` and `farmproduce`

### TMUX
The cron task is started in a tmux session so that we can attach to it later on.
To attach to existing session, after ssh type,
```
tmux attach
```
To kill the script type `ctrl+c` and to detach press `ctrl+b` and then `d`

### Files system

The Raspberry Pi has the following Files:
> ghfarm.py

This File contains the code to control the entire weighing machine. It works as per the workflow shown in `flow.txt`. To add functionality to the weighing machine this file has to be modified.

> client.py

This file contains the code to send the data that was stored `details.txt`

> constants.py

This file stores all the constants required. To change variables across all files change it in this file.  

> kpad.py, loadcell.py, lcd.py

These are files for the raspberry pi modules.
