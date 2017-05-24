#!usr/bin/python3
import socket
import json

data = {'username': "machine_1",'password': "random"}

HOST, PORT = "localhost", 1152

# Create a socket (SOCK_STREAM means a TCP socket)
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

try:
    # Connect to server and send data
    sock.connect((HOST, PORT))
    sock.send(bytes(json.dumps(data), "utf-8"))
    crop =""
    # Receive data from the server and shut down
    received = str(sock.recv(1024), "utf-8")
    if received =="Authenticated":
    	crop = {'weight':200,'crop_id':'Potato'}
    	sock.send(bytes(json.dumps(crop), "utf-8"))
finally:
    sock.close()

print("Sent:     {}".format(json.dumps(data)))
print("Received: {}".format(received))
print("Sent:     {}".format(json.dumps(crop)))