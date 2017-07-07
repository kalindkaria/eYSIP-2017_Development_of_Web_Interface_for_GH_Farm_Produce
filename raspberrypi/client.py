import requests  
import json
import datetime
import os
import constants

# If the data_offline file exists
if os.path.getsize(constants.data_offline) > 0:
	crop_details = []
	pending = []
	# Read the file
	with open(constants.data_offline, 'r') as f:
		crop_details = list(f.readlines())
	last = crop_details[len(crop_details) - 1]
	i=1
	print(crop_details)
	# Loop through all details
	for details in crop_details:
		values = json.loads(details)
		values['user_id']= constants.MACHINE_ID
		values['password']= constants.PASSWORD
		values['upload']='offline'
		# Open image and send as binary string
		with open(constants.imagepath + values['imagename'], 'rb') as img:
			image = img.read()
			image = str(image,"latin-1")
			print("Image Size: ",len(image)/1024," KB")
		values['image']=image
		i=i+1
		try:
			# Try to send the data and add to pending whatever is not sent
			r = requests.post(constants.URL, data=json.dumps(values))
			print(r.text)
			if(r.text != "Done"):
				pending.append(details)
		except:
			pending.append(details)
			print("Error occured")
	# Save the data that was not sent into the data_offline file
	with open(constants.data_offline, 'w') as detail_file:
		for details in pending:
			detail_file.write(details)



