import requests  
import json
import datetime
import os

#NETWORK Constants
URL = "http://192.168.0.111:8000/machine/"
USER_ID = 1
PASSWORD = "random"
imagepath = "/home/pi/ghfarm/images/"
STORAGELOCATION = "/home/pi/ghfarm/details.txt"

# If the offline file exits
if os.path.getsize(STORAGELOCATION) > 0:
	crop_details = []
	pending = []
	# Extract all pending details into a list of json strings
	with open(STORAGELOCATION, 'r') as f:
		crop_details = list(f.readlines())
	last = crop_details[len(crop_details) - 1]
	i=1
	print(crop_details)
	for details in crop_details:
		# Convert json string to a list
		values = json.loads(details)
		# Adding the machine's username and password to the data
		values['user_id'] = USER_ID
		values['password'] = PASSWORD
		values['upload'] = 'offline'
		with open(imagepath + values['imagename'], 'rb') as img:
			image = img.read()
			image = str(image,"latin-1")
			print(len(image))
		values['image']=image
		i=i+1
		# try to send the data to the server.
		try:
			r = requests.post(URL, data=json.dumps(values))
			print(type(r.text))
			print(r.text)
			if(r.text != "Done"):
				pending.append(details)
		except:
			pending.append(details)
			print("Error occured")
	# Store all the unsent data into the file again
	with open(STORAGELOCATION, 'w') as detail_file:
		for details in pending:
			detail_file.write(details)



