import json
import os
import datetime
from machine import *
from django.views.decorators.csrf import csrf_exempt
from farmapp.models import Produce, Machine, Crop, Trough, User, Inventory
from django.http import HttpResponse


# Function to check if the machine trying to log exists.
def auth_user(machine_data):
    try:
        machine = Machine.objects.get(machine_id=machine_data['user_id'], password=machine_data['password'])
        print(machine)
        return 1
    except Exception as e:
        print(e)
        return 0


# Update the inventory when the produce is logged.
def update_inventory(entry):
    user = entry.machine_id.user_id
    try:
        inventory = Inventory.objects.get(user_id=user, crop_id=entry.crop_id)
        inventory.weight = inventory.weight + entry.weight
        inventory.save()
        crop = Crop.objects.get(crop_id=entry.crop_id.crop_id)
        crop.availability = crop.availability + entry.weight
        crop.save()
    except:
        print("In first exception"+str(user)+str(entry.crop_id))
        try:
            Inventory.objects.create(user_id=user, crop_id=entry.crop_id, weight=entry.weight)
            crop = Crop.objects.get(crop_id=entry.crop_id.crop_id)
            crop.availability = crop.availability + entry.weight
            crop.save()
        except Exception as e:
            print(e+"Hello")



# The main view to handle the data logged by the machine. It checks the machines authentication
# and then logs the produce into the database and inventory.
@csrf_exempt
def data_entry(request):
    if request.method == 'POST':
        crop = json.loads(request.body.decode('utf-8'))
        auth = auth_user(crop)
        if auth == 1:
            imagepath = os.getcwd() + "/images/"
            time = datetime.datetime.strptime(crop['time'], '%Y-%m-%d %H:%M:%S')
            imagepath = imagepath + crop['imagename']
            with open(imagepath, 'wb') as img_file:
                byte_str = crop['image']
                img_file.write(bytes(byte_str, 'latin-1'))

            print(crop['user_id'])
            print(crop['crop_id'])
            print(crop['troughid'])
            print(crop['imagename'])
            print(crop['weight'])
            print(time)
            print(0)
            try:
                entry = Produce(machine_id=Machine.objects.get(pk=crop['user_id']),
                                crop_id=Crop.objects.get(pk=crop['crop_id']),
                                trough_id=Trough.objects.get(pk=crop['troughid']),
                                image=crop['imagename'],
                                weight=crop['weight'],
                                date_of_produce=time,
                                timestamp=datetime.datetime.now(),
                                status=0)
                input_crop = Crop.objects.get(crop_id=crop['crop_id'])
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
    return HttpResponse("ALive")

