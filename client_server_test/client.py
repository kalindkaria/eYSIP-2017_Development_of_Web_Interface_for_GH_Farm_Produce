#!usr/bin/python3
import socket
import json
import datetime

data = {'username': "machine_1",'password': "random"}

HOST, PORT = "localhost", 1152

# Create a socket (SOCK_STREAM means a TCP socket)
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

try:
	# Connect to server and send data
	sock.connect((HOST, PORT))
	sock.send(bytes(json.dumps(data), "utf-8"))
	response = ""
	crop_details = []
	# Receive data from the server and shut down
	received = str(sock.recv(1024), "utf-8")
	if received =="Authenticated":
		time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
		with open('details.txt', 'r') as f:
			crop_details = list(f.readlines())
		last = crop_details[len(crop_details)-1]
		pending = []
		print(crop_details)
		for details in crop_details:
			sock.send(bytes(details, "utf-8"))
			response = str(sock.recv(1024), "utf-8")
			print (response)
			if(response != 'Done'):
				pending.append(details)
				print (response)
				print(crop_details)
			if(details!=last):
				sock.sendall(bytes("continue", "utf-8"))
			else:
				sock.sendall(bytes("break", "utf-8"))
			send = str(sock.recv(1024), "utf-8")



		f = open('details.txt','w')
		for details in pending:
			f.write(details)
		f.close()

except:
	print("Connection Refused")

finally:
    sock.close()

#print("Sent:     {}".format(json.dumps(data)))
#print("Received: {}".format(received))
#print("Sent:     {}".format(json.dumps(crop_details)))
#print("Response: {}".format(response))