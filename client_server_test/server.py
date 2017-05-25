import socketserver
import threading
import json
import MySQLdb

db = MySQLdb.connect("localhost","root","12345","Farm" )
cursor = db.cursor()

class ThreadedTCPRequestHandler(socketserver.BaseRequestHandler):
	def handle(self):
		data = str(self.request.recv(1024).strip(), "utf-8")
		data = json.loads(data)
		auth=auth_user(data)
		if auth==0:
			self.request.sendall(bytes("Authenticated", "utf-8"))
			#image = 
			crop = str(self.request.recv(1024).strip(), "utf-8")
			crop = json.loads(crop)
			insert="INSERT INTO Crop(crop_id,weight) VALUES ('%s',%s)" % (crop['crop_id'],crop['weight'])
			cursor.execute(insert)
			db.commit()

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
