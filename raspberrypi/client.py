import requests  
import json
import math
import datetime
import os


if os.path.getsize("/home/pi/ghfarm/details.txt") > 0:
	imagepath = "/home/pi/ghfarm/images/"
	# entrypath = "/home/pi/ghfarm/entry/"
	# authpath = "/home/pi/ghfarm/entry/"
	machine_data= {'user_id': 1,'password': "random"}
	# auth_file= open(authpath,'w')
	# auth_file.write(json.dumps(machine_data))
	crop_details = []
	pending = []

	time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
	with open('/home/pi/ghfarm/details.txt', 'r') as f:
		crop_details = list(f.readlines())
	last = crop_details[len(crop_details) - 1]
	i=1
	print(crop_details)
	for details in crop_details:
		values = json.loads(details)
		values['user_id']=1
		values['password']='random'
		# entry_file = open(entrypath,'w')
		# entry_file.write(details)
		with open(imagepath + values['imagename'], 'rb') as img:
			image = img.read()
			image = str(image,"latin-1")
			print(len(image))
		#files = {'image': open(imagepath + values['imagename'], 'rb'),'entry':open(entrypath,'r'),'auth':open(authpath,'r')}
		values['image']=image
		#machine_data[str(i)] = values
		i=i+1

		

		url = "http://192.168.43.90:8000/machine/"
		#headers = {'content-type': 'application/json'}
		#r = requests.post(url, files=files)
		r = requests.post(url, data=json.dumps(values))
		print(r.text)
		if(r.text != "Done"):
			pending.append(details)
			# files = {'image': open(imagepath + values['imagename'], 'rb')}
			# r = requests.post(url, files=files)
		
			

	# f = open('/home/pi/ghfarm/details.txt', 'w')
	# f.close()


