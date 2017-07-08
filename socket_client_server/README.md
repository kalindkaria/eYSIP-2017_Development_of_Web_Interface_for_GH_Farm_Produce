# Client Server Communication via Sockets

### This module was not used in final project.

The files in this folder were used to create a client and server communicaion between the raspberry pi and the server using sockets. The `client/` was copied onto the raspberry pi and then the json data stored into the `details.txt` by the pi using another script.(For trial we used the `manage.py`)

The data which consists of details and a image was sent by the client which was recieved by the server. The server also stored the image into the `images/` directory and stored the data into the SQL database.

__We later on decided to scrap the entire socket based communication and make use of the better `REST API` to transfer data between the Raspberry Pi and the server. More details on why we changed our mind can be found [here](https://github.com/eYSIP-2017/eYSIP-2017_Development_of_Web_Interface_for_GH_Farm_Produce/wiki/Project-Log#client-server-communication).__
