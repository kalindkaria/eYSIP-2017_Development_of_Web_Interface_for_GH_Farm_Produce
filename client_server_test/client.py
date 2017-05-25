#!usr/bin/python3
import socket
import json
import datetime

data = {'username': "machine_1",'password': "random"}

HOST, PORT = "192.168.43.242", 1152

# Create a socket (SOCK_STREAM means a TCP socket)
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

try:
    # Connect to server and send data
    sock.connect((HOST, PORT))
    sock.send(bytes(json.dumps(data), "utf-8"))
    response = ""
    # Receive data from the server and shut down
    received = str(sock.recv(1024), "utf-8")
    if received =="Authenticated":
    	time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    	crops = {'weight':90,'crop_id':'Spinach','time': time}
    	sock.send(bytes(json.dumps(crops), "utf-8"))
    	response = str(sock.recv(1024), "utf-8")
finally:
    sock.close()

print("Sent:     {}".format(json.dumps(data)))
print("Received: {}".format(received))
print("Sent:     {}".format(json.dumps(crops)))
print("Response: {}".format(response))