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
