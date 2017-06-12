from django.views.decorators.csrf import csrf_exempt
from farmapp.models import Crop, Machine
from django.http import HttpResponse
import nostradamus
import json
import os


# Function to check if the machine trying to log exists.
def auth_user(machine_data):
    try:
        machine = Machine.objects.get(machine_id = machine_data['user_id'], password = machine_data['password'])
        print(machine)
        return 1
    except Exception as e:
        print(e)
        return 0


# Function to predict the type of crop.
@csrf_exempt
def predict(request):
    if request.method =='POST':
        crop = json.loads(request.body.decode('utf-8'))
        auth = auth_user(crop)
        if auth == 1:
            imagepath = os.getcwd() + "/images/" + crop['imagename']
            with open(imagepath, 'wb') as img_file:
                byte_str = crop['image']
                img_file.write(bytes(byte_str,'latin-1'))

            # Predicting Crop_ID
            prediction = nostradamus.predict(imagepath)
            cropid = Crop.objects.get(english_name__iexact=prediction)
            reply = {'prediction': prediction, 'crop_id': cropid.pk}
            return HttpResponse(json.dumps(reply))
        return HttpResponse("Authentication Failed")
    return HttpResponse("Alive")

