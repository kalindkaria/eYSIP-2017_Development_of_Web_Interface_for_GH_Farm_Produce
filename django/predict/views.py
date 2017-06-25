import json
import os

import nostradamus
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from farmapp.models import Crop, Machine


# Function to check if the machine trying to log exists.
def auth_user(machine_data):
    try:
        machine = Machine.objects.get(machine_id=machine_data['user_id'], password=machine_data['password'])
        print(machine)
        return 1
    except Exception as e:
        print(e)
        return 0


# Function to predict the type of crop.
@csrf_exempt
def predict(request):
    if request.method == 'POST':
        crop = json.loads(request.body.decode('utf-8'))
        auth = auth_user(crop)
        if auth == 1:
            imagepath = os.getcwd() + "/images/" + crop['imagename']
            with open(imagepath, 'wb') as img_file:
                byte_str = crop['image']
                img_file.write(bytes(byte_str, 'latin-1'))

            # Predict Crop_ID
            percentages, crop_names = nostradamus.predict(imagepath)
            primary_keys = []

            # Get all crop names
            all_crop_objects = Crop.objects.all()
            all_crop_names = []
            for c in all_crop_objects:
                all_crop_names.append(c.short_name)

            # Calculate primary keys
            for i, c in enumerate(crop_names):
                cid = Crop.objects.get(short_name__iexact=c)
                crop_names[i] = cid.short_name
                primary_keys.append(cid.pk)

            # Add remaining crop names with 0% accuracy (Crops which haven't been trained on)
            crop_names_remaining = [c for c in all_crop_names if not c in crop_names]
            pks_remaining = []
            percentages_remaining = []
            for c in crop_names_remaining:
                pks_remaining.append(Crop.objects.get(short_name=c).pk)
                percentages_remaining.append(0.00)

            # Add data to payload to send
            crop_names = crop_names + crop_names_remaining
            percentages = percentages + percentages_remaining
            primary_keys = primary_keys + pks_remaining

            # Send the Payload
            send = [crop_names, percentages, primary_keys]
            return HttpResponse(json.dumps(send))

        return HttpResponse("Authentication Failed")
    return HttpResponse("Alive")
