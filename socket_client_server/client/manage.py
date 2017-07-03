# Create and Store Fake DATA into the details.txt File.

import json
import datetime

f = open('details.txt','w')
time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
crops = {'weight':150,'crop_id':'apple','time': time}
crop_details = json.dumps(crops)
f.write(crop_details +'\n')
time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
crops = {'weight':250,'crop_id':'capsicum','time': time}
crop_details = json.dumps(crops)
f.write(crop_details +'\n')
time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
crops = {'weight':550,'crop_id':'onion','time': time}
crop_details = json.dumps(crops)
f.write(crop_details +'\n')
time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
crops = {'weight':650,'crop_id':'potato','time': time}
crop_details = json.dumps(crops)
f.write(crop_details +'\n')

f.close()