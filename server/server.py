import socketserver
import threading
import json
import os
import MySQLdb
from datetime import datetime

imagepath = os.getcwd()+"/images/"
if not os.path.exists(imagepath):
    os.makedirs(imagepath)

db = MySQLdb.connect("localhost","root","12345","Farm" )
cursor = db.cursor()

class ThreadedTCPRequestHandler(socketserver.BaseRequestHandler):
	def handle(self):
		
		self.request.settimeout(100)
		data = str(self.request.recv(1024).strip(), "utf-8")
		data = json.loads(data)
		auth=auth_user(data)
		if auth==0:
			self.request.sendall(bytes("Authenticated", "utf-8"))
			while True:
				crop = str(self.request.recv(1024).strip(), "utf-8")
				crop = json.loads(crop)
				# print(crop)
				time = datetime.strptime(crop['time'], '%Y-%m-%d %H:%M:%S')
				time = time.isoformat()
				self.request.sendall(bytes("imageResponse", "utf-8"))
				file_size = int(str(self.request.recv(1024),"utf-8"))
				self.request.sendall(bytes("sendImgSize", "utf-8"))
				
				received_len = 0

				fp = open(imagepath+crop['imagename'],'wb')
				while received_len != file_size:
					print(received_len)
					strng = self.request.recv(1024)
					if not strng:
						break
					fp.write(strng)
					received_len = received_len + 1
				fp.close()

				insert="INSERT INTO Crop(crop_id,weight,time) VALUES ('%s',%s,'%s')" % (crop['crop_id'],crop['weight'],time)
				if cursor.execute(insert):
					db.commit()
					self.request.sendall(bytes("Done", "utf-8"))
					loop = str(self.request.recv(1024), "utf-8")
					print(loop)					
					if loop == "break":
						self.request.sendall(bytes("send", "utf-8"))
						break
					elif loop == "continue":
						self.request.sendall(bytes("send", "utf-8"))
				else:
					db.rollback()
					self.request.sendall(bytes("Rejected", "utf-8"))

		elif auth==-1:
			self.request.sendall(bytes("Invalid Password", "utf-8"))
		elif auth==-2:
			self.request.sendall(bytes("Invalid User", "utf-8"))


class ThreadedTCPServer(socketserver.ThreadingMixIn, socketserver.TCPServer):
    pass

def auth_user(data):
	#insert sql query here.
	select = "SELECT username,password FROM User WHERE username = '%s'" % (data['username'])
	try:
		if cursor.execute(select):
			result = cursor.fetchone()
			if result[1] == data['password']:
				return 0
			else:
				return -1
		else:
			return -2	
	except:
	   print ("Error: unable to fetch data")

	

if __name__ == "__main__":
    # Port 0 means to select an arbitrary unused port
    HOST, PORT = "0.0.0.0", 1152

    server = ThreadedTCPServer((HOST, PORT), ThreadedTCPRequestHandler)
    ip, port = server.server_address
    server_thread = threading.Thread(target=server.serve_forever)
    server_thread.daemon = True
    server_thread.start()
    print("Server loop running in thread:", server_thread.name)
    server.serve_forever()
    # while True:
    # 	server.handle_request()
