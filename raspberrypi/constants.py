import os
# URL to the machine app, eg: "http://store.k-yantra.org/machine/"
URL = "http://192.168.0.200:8000/machine/"
# URL to predict app, eg: "http://store.k-yantra.org/predict/"
PREDICT_URL = "http://192.168.0.200:8000/predict/"
# Machine_ID of the machine as set by admin
MACHINE_ID = 1
# Password of the machine as set by admin
PASSWORD = "random"
# Paths to where images are stored in the system
imagepath = "/home/pi/ghfarm/images/"
# Path to file that stores crop_names offline
crop_offline = "/home/pi/ghfarm/crop_offline.txt"
# Path to file that stores pending offline
data_offline = "/home/pi/ghfarm/details.txt"

# Make Paths 
if not os.path.exists(imagepath):
	os.makedirs(imagepath)
if not os.path.exists(crop_offline):
	os.makedirs(crop_offline)
if not os.path.exists(data_offline):
	os.makedirs(data_offline)