import requests  
import json
import datetime
import os


if os.path.getsize("/home/pi/ghfarm/details.txt") > 0:
	imagepath = "/home/pi/ghfarm/images/"
	crop_details = []
	pending = []
	url = "http://192.168.43.90:8000/machine/"
	#time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
	with open('/home/pi/ghfarm/details.txt', 'r') as f:
		crop_details = list(f.readlines())
	last = crop_details[len(crop_details) - 1]
	i=1
	print(crop_details)
	for details in crop_details:
		values = json.loads(details)
		values['user_id']=1
		values['password']='random'
		with open(imagepath + values['imagename'], 'rb') as img:
			image = img.read()
			image = str(image,"latin-1")
			print(len(image))
		values['image']=image
		i=i+1
		try:
			r = requests.post(url, data=json.dumps(values))
			print(type(r.text))
			print(r.text)
			if(r.text != "Done"):
				pending.append(details)
		except:
			print("Error occured")

	with open('/home/pi/ghfarm/details.txt', 'w') as detail_file:
		for details in pending:
			detail_file.write(details)



