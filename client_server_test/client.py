#!usr/bin/python3
import socket
import json

data = {'username': "machine1",'password': "random"}

HOST, PORT = "192.168.43.242", 1152

# Create a socket (SOCK_STREAM means a TCP socket)
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

try:
    # Connect to server and send data
    sock.connect((HOST, PORT))
    sock.send(bytes(json.dumps(data), "utf-8"))

    # Receive data from the server and shut down
    received = str(sock.recv(1024), "utf-8")
    if received =="Authenticated":
    	crops = {'weight':200,'crop_id':'Potato'}
    	sock.send(bytes(json.dumps(crops), "utf-8"))
finally:
    sock.close()

print("Sent:     {}".format(json.dumps(data)))
print("Received: {}".format(received))
print("Sent:     {}".format(json.dumps(crops)))
