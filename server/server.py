import socketserver
import threading
import json
import MySQLdb
from datetime import datetime

db = MySQLdb.connect("0.0.0.0","root","12345","Farm" )
cursor = db.cursor()

class ThreadedTCPRequestHandler(socketserver.BaseRequestHandler):
	def handle(self):
		try:
			self.request.settimeout(100)
			data = str(self.request.recv(1024).strip(), "utf-8")
			data = json.loads(data)
			auth=auth_user(data)
			if auth==0:
				self.request.sendall(bytes("Authenticated", "utf-8"))
				while True:
					crop = str(self.request.recv(1024).strip(), "utf-8")
					crop = json.loads(crop)
					print(crop)
					time = datetime.strptime(crop['time'], '%Y-%m-%d %H:%M:%S')
					time = time.isoformat()
					
					insert="INSERT INTO Crop(crop_id,weight,time) VALUES ('%s',%s,'%s')" % (crop['crop_id'],crop['weight'],time)
					if cursor.execute(insert):
						db.commit()
						self.request.sendall(bytes("Done", "utf-8"))
						loop = str(self.request.recv(1024), "utf-8")
						print(loop)					
						if loop == "break":
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
		except Exception as e:
			print("An Exception Occured of type {0}. Arguments:\n{1!r}".format(type(e).__name__,e.args))


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
	print("Server loop running in thread:"+server_thread.name+" (Press `ctrl+c` to exit)")
	try:
		server.serve_forever()
	except:
		print("\nClosing the server")