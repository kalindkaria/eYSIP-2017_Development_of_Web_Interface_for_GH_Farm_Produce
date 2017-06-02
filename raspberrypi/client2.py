import requests  
import json
import math
import datetime


if os.path.getsize("/home/pi/ghfarm/details.txt") > 0:
	machine_data= {'username': "machine_1",'password': "random"}
	crop_details = []
	# Receive data from the server and shut down
	time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
	with open('/home/pi/ghfarm/details.txt', 'r') as f:
		crop_details = list(f.readlines())
	last = crop_details[len(crop_details) - 1]
	i=0
	print(crop_details)
	for details in crop_details:
		values = json.loads(details)
		img = open(imagepath + values['imagename'], 'rb')
		values['image'] = img.read()

		machine_data[i] = values
		i=i+1

		img.close()

		url = "http://192.168.43.242:8000"
		headers = {'content-type': 'application/json'}
		r = requests.get(url, data=json.dumps(machine_data), headers=headers)
		print(r.text)
		if(r.text == "Done"):
			f = open('/home/pi/ghfarm/details.txt', 'w')
			f.close()


