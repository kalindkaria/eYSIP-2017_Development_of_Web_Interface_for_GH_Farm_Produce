from django.shortcuts import render
import json
import os
from datetime import datetime
from farmapp.models import Produce,Machine
from django.http import StreamingHttpResponse

def auth_user(machine_data):
    try:
        machine = Machine.objects.get(user_id = machine_data['user_id'], password = machine_data['password'])
        print(machine)
        return 1
    except:
        return 0

def data_entry(request):
    if request.method=='GET':
        machine_data = json.loads(request.body.decode("utf-8"))
        auth = auth_user(machine_data)
        imagepath = os.getcwd() + "/images/"
        if auth == 1:
            i=1
            while machine_data.has_key(i):
                crop = machine_data[i]

                time = datetime.strptime(crop['time'], '%Y-%m-%d %H:%M:%S')
                time = time.isoformat()

                img_file = open(imagepath + crop['imagename'], 'w')
                img_file.write(crop['image'])

                print(machine_data['user_id']+" "+crop['crop_id']+" "+crop['trough_id']+" "+crop['imagename']+crop['weight']+" "+time+" "+0)

                # try:
                #     entry = Produce.objects.create(machine_id = machine_data['user_id'],\
                #                                    crop_id = crop['crop_id'],\
                #                                    trough_id = crop['trough_id'],\
                #                                    image = imagepath + crop['imagename'],\
                #                                    weight = crop['weight'],\
                #                                    timestamp = time,\
                #                                    status = 0\
                #                                   )
                #     print(entry)
                # except:
                #     j=1
                #     while machine_data.has_key(j):
                #         crop = machine_data[j]
                #         Produce.objects.filter(machine_id = machine_data['user_id'],\
                #                                        crop_id = crop['crop_id'],\
                #                                        trough_id = crop['trough_id'],\
                #                                        image = imagepath + crop['imagename'],\
                #                                        weight = crop['weight'],\
                #                                        timestamp = time,\
                #                                        status = 0).delete()
                #         j=j+1
                #     return StreamingHttpResponse("Error")

                i=i+1
            return StreamingHttpResponse("Done")

        if auth==0:
            return StreamingHttpResponse("Invalid")







