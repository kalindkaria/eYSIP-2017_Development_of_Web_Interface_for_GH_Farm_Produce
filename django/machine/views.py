from django.shortcuts import render
import json
import os
from datetime import datetime
from django.views.decorators.csrf import csrf_exempt
from farmapp.models import Produce,Machine,Crop
from django.http import HttpResponse

def auth_user(machine_data):
    try:
        machine = Machine.objects.get(user_id = machine_data['user_id'], password = machine_data['password'])
        print(machine)
        return 1
    except:
        return 0


@csrf_exempt
def data_entry(request):
    if request.method=='POST':
        crop = json.loads(request.body.decode('utf-8'))
        auth = auth_user(crop)
        imagepath = os.getcwd() + "/images/"
        if auth == 1:
            time = datetime.strptime(crop['time'], '%Y-%m-%d %H:%M:%S')
            time = time.isoformat()

            with open(imagepath + crop['imagename'], 'wb') as img_file:
                byte_str = crop['image']
                img_file.write(bytes(byte_str,'latin-1'))

            print(crop['user_id'])
            print(crop['crop_id'])
            print(crop['troughid'])
            print(crop['imagename'])
            print(crop['weight'])
            print(time)
            print(0)
            try:
                entry = Produce.objects.create(machine_id = crop['user_id'],\
                                               crop_id = crop['crop_id'],\
                                               trough_id = crop['trough_id'],\
                                               image = imagepath + crop['imagename'],\
                                               weight = crop['weight'],\
                                               date_of_produce = time,\
                                               status = 0\
                                              )
                input_crop = Crop.objects.get(crop_id = crop['crop_id'])
                entry.date_of_expiry = entry.date_of_produce + datetime.timedelta(hours=input_crop.shelf_life)
                entry.save()
                print("Entry done")
                return HttpResponse("Done")
            except:
                return HttpResponse("Error")

        elif auth == 0:
            return HttpResponse("Invalid")







