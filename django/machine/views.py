from django.shortcuts import render
import json
import os
import datetime

from django.views.decorators.csrf import csrf_exempt
from farmapp.models import Produce,Machine,Crop,Trough,User,Inventory
from django.http import HttpResponse

def auth_user(machine_data):
    try:
        machine = Machine.objects.get(machine_id = machine_data['user_id'], password = machine_data['password'])
        print(machine)
        return 1
    except Exception as e:
        print(e)
        return 0

def update_inventory(entry):
    user = entry.machine_id.user_id
    try:
        inventory = Inventory.objects.get(user_id = user,crop_id = entry.crop_id)
        inventory.weight = inventory.weight + entry.weight
        inventory.save()
    except :
        inventory = Inventory.objects.create(user_id = user,crop_id = entry.crop_id,weight=entry.weight)

@csrf_exempt
def data_entry(request):
    if request.method=='POST':
        crop = json.loads(request.body.decode('utf-8'))
        auth = auth_user(crop)
        imagepath = os.getcwd() + "/images/"
        if auth == 1:
            time = datetime.datetime.strptime(crop['time'], '%Y-%m-%d %H:%M:%S')
            #time = time.isoformat()

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
                entry = Produce(machine_id = Machine.objects.get(pk = crop['user_id']),\
                                               crop_id = Crop.objects.get(pk = crop['crop_id']),\
                                               trough_id = Trough.objects.get(pk = crop['troughid']),\
                                               image = crop['imagename'],\
                                               weight = crop['weight'],\
                                               date_of_produce = time,\
                                               timestamp = datetime.datetime.now(),\
                                               status = 0\
                                              )
                input_crop = Crop.objects.get(crop_id = crop['crop_id'])

                entry.date_of_expiry = entry.date_of_produce + datetime.timedelta(hours=input_crop.shelf_life)
                entry.save()
                update_inventory(entry)
                print("Entry done")
                return HttpResponse("Done")
            except Exception as e:
                print(e)
                return HttpResponse("Error")

        elif auth == 0:
            return HttpResponse("Invalid")







