import datetime
import json
import os
from threading import Thread, Lock

import requests
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from farmapp.models import Produce, Machine, Crop, Inventory
from machine import *

AUTOTRAIN_DIRECTORY = os.getcwd() + "/autotrain/"


# Function to check if the machine trying to log exists.
def auth_user(machine_data):
    try:
        machine = Machine.objects.get(machine_id=machine_data['user_id'], password=machine_data['password'])
        return machine
    except Exception as e:
        print("Error: ",e)
        return None


# Update the inventory when the produce is logged.
def update_inventory(entry):
    user = entry.machine_id.user_id
    try:
        inventory = Inventory.objects.get(user_id=user, crop_id=entry.crop_id)
        inventory.weight = inventory.weight + entry.weight
        inventory.save()
        entry.date_of_expiry = entry.date_of_produce + datetime.timedelta(hours=inventory.shelf_life)
        entry.save()
        crop = Crop.objects.get(crop_id=entry.crop_id.crop_id)
        crop.availability = crop.availability + entry.weight
        crop.save()
    except:
        print("In first exception" + str(user) + str(entry.crop_id))
        try:
            inventory = Inventory.objects.create(user_id=user, crop_id=entry.crop_id, weight=entry.weight)
            entry.date_of_expiry = entry.date_of_produce + datetime.timedelta(hours=inventory.shelf_life)
            entry.save()
            crop = Crop.objects.get(crop_id=entry.crop_id.crop_id)
            crop.availability = crop.availability + entry.weight
            crop.save()
        except Exception as e:
            print(e + "Hello")


def store_data_for_training(training_data):
    lock = Lock()
    try:
        # Create folder to store image if it does not exist
        class_folder = os.path.join(AUTOTRAIN_DIRECTORY, training_data['label'])
        if not os.path.exists(class_folder):
            os.makedirs(class_folder)

        # Write image to folder
        image_path = os.path.join(class_folder, training_data['image_name'])
        with open(image_path, 'wb') as img_file:
            img_file.write(bytes(training_data['image'], 'latin-1'))

        # Acquiring Lock to print.
        lock.acquire()
        print("Successfully written image at location: " + image_path)
        lock.release()
    except Exception as e:
        lock.acquire()
        print("Couldn't save data for training because of ", e)
        lock.release()


# The main view to handle the data logged by the machine. It checks the machines authentication
# and then logs the produce into the database and inventory.
@csrf_exempt
def data_entry(request):
    if request.method == 'POST':
        crop = json.loads(request.body.decode('utf-8'))
        auth = auth_user(crop)
        if auth:
            imagepath = os.getcwd() + "/images/"
            time = datetime.datetime.strptime(crop['time'], '%Y-%m-%d %H:%M:%S')
            imagepath = imagepath + crop['imagename']

            # Make a copy to send for training
            training_image = crop['image']

            with open(imagepath, 'wb') as img_file:
                byte_str = crop['image']
                img_file.write(bytes(byte_str, 'latin-1'))
            print("Recieved Data from Machine "+str(auth.machine_id)+":")
            print(crop['user_id'],crop['crop_id'],crop['farmid'],crop['imagename'],crop['weight'],time)
            try:
                entry = Produce(machine_id=Machine.objects.get(pk=crop['user_id']),
                                crop_id=Crop.objects.get(pk=crop['crop_id']),
                                farm_id=crop['farmid'],
                                image=crop['imagename'],
                                weight=crop['weight'],
                                date_of_produce=time,
                                timestamp=datetime.datetime.now()
                                )
                update_inventory(entry)

                training_image_name = entry.image
                training_label = entry.crop_id.short_name

                # Data to save for training
                training_data = {'label': training_label, 'image': training_image,
                                 'image_name': training_image_name}

                # Try to save training_data for the train server.
                thread = Thread(target=store_data_for_training, args=(training_data,))
                thread.daemon = True
                thread.start()

                print("Entry done")
                return HttpResponse("Done")
            except Exception as e:
                print(e)
                return HttpResponse("Error")
        elif auth == 0:
            return HttpResponse("Invalid")
    return HttpResponse("Alive")
