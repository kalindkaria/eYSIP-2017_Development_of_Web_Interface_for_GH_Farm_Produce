import loadcell as lc #import load cell library
import RPi.GPIO as GPIO
import lcd	#import lcd library
import kpad	#import keypad library
import time
import os
import math
import datetime
import sys
import json

#address constant for lines in lcd display
LINE_1 = 0x80
LINE_2 = 0xC0
LINE_3 = 0x94
LINE_4 = 0xD4

#Global Variables
min_weight = 10
baseValue = 0	#variable to store the base value of load cell
taredWeight = 0	#variable to store tared weight
DOUT = 22	#constant stores gpio pin used by dout pin of hx711. It will be used to check if hx711 is ready to send data or not


'''
*
* Function Name: 	calculateWeight
* Input: 			none
* Output: 			returns the calculated weight from the load cell value
* Logic: 			1) take the reading from load cell
*					2) take the difference between current value and base value
*					3) divide the difference with diference got with known weight
*					4) finally multiply the division answer with known weight value to get the weight
* Example Call:		calculateWeight()
*
'''
def caculateWeight():
	global taredWeight
	global baseValue
	val = lc.read_cell_value()  #read load cell value
	weight = ((baseValue - val) / 49000.0) * 230.0  #convert them into weight
	weight = weight - taredWeight  #remove tared weight from calculated weight
	if weight < 0:	#if weight becomes negative then set it back to zero
		weight = 0
	return int(weight)
	
def displayWeight():
	lcd.string("Object weight is:", LINE_3)
	weight = caculateWeight()	#get calculated weight from the calculateWeight function
	lcd.string(str(weight) + " grams", LINE_4)	#display the weight on the lcd
	if weight < min_weight:
		lcd.string("Place your object on", LINE_1)
		lcd.string("the platform", LINE_2)
	else:
		lcd.string("Press * button to", LINE_1)
		lcd.string("continue.", LINE_2)
	return weight
	
def tare():
	global baseValue
	global taredWeight
	lcd.clear()
	lcd.string("Taring weight...", LINE_1)
	lcval = lc.read_average_value(10)
	diff = math.fabs(baseValue- lcval)
	taredWeight = (diff / 49000.0) * 230.0  #store the calculated weight in variable

def takePicture():
	lcd.clear()
	lcd.string("Taking picture...", LINE_2)
	if os.path.exists('/dev/video0'):
		#create image file name with current date
		imgName = "image-" + datetime.datetime.now().isoformat() + ".jpg"
		imagepath = "/home/pi/ghfarm/images/%s" %imgName
		#capture image and save in images directory. if image file does not exists in folder then retake the image
		while os.path.isfile(imagepath) == False:
			os.system("fswebcam -r 1080x1080 -S 10 --scale 300x300 --no-banner %s" %imagepath)
		return True, imgName
	else:	#if camera is not attached display error message
		lcd.clear()
		lcd.string("      FAILED", LINE_1)
		lcd.string("No camera attached", LINE_2)
		time.sleep(2)
		return False, "NoCamera"
		

def storeData(data):
	lcd.clear()
	lcd.string("Storing data...", LINE_1)
	lcd.string("Weight: "+str(data['weight']), LINE_2)
	lcd.string("CropID: "+str(data['cropid']), LINE_3)
	lcd.string("TroughID: "+str(data['troughid']), LINE_4)
	f = open('/home/pi/ghfarm/details.txt','a')
	t = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
	crops = {'weight':data['weight'],'crop_id':data['cropid'],'time': t, 'imagename':data['imagename'], 'troughid':data['troughid']}
	crop_details = json.dumps(crops)
	f.write(crop_details +'\n')
	time.sleep(3)

def validateCropID():
	return True

def acceptCropID():
	lcd.clear()
	cropID = ""
	key = ""
	time.sleep(0.1)

	lcd.string(" Enter Crop ID  ", LINE_1)
	lcd.string("  *- continue   ", LINE_2)
	lcd.string("#- clear,D- back", LINE_3)
	#loop until some crop id is entered and * key is pressed. Following loop will run until valid crop id entered
	while True:
		while  key != "*":
			lcd.string(cropID, LINE_4)
			key = kpad.get_key()
			if key == '*':
				if len(cropID) == 0:
					lcd.clear()
					lcd.string("Crop ID cant", LINE_1)
					lcd.string("be null", LINE_2)
					time.sleep(1)
					lcd.clear()
					lcd.string(" Enter Crop ID  ", LINE_1)
					lcd.string("  *- continue   ", LINE_2)
					lcd.string("#- clear,D- back", LINE_3)
				else:
					break
			elif key == '#':  #for backspacing
				if len(cropID) > 0:
					cropID = cropID[:-1]
				time.sleep(0.1)
			elif key == 'D':  #return to previous menu
					return False, ""
			elif key.isdigit():
				cropID += key
				time.sleep(0.2)
			key = ""
		if validateCropID(): # verify trough id
				return True, cropID
		else:
			lcd.clear()
			lcd.string("Trough ID is", LINE_1)
			lcd.string("    Invalid!", LINE_2)
			lcd.string("Please Try Again", LINE_3)
			time.sleep(1)

def validateTroughID():
	return True
	
def acceptTroughID():
	lcd.clear()
	troughID = ""
	key = "E"
	time.sleep(0.1)
	lcd.string("Enter Trough ID", LINE_1)
	lcd.string("*- continue", LINE_2)
	lcd.string("#- clear D- back", LINE_3)
	#loop until some trough id is entered and * key is pressed. Following loop will only break when valid trough ID is entered
	while True:
		while  key != "*":
			lcd.string(troughID, LINE_4)
			key = kpad.get_key()
			if key == '*':
				if len(troughID) == 0:
					lcd.clear()
					lcd.string("Trough ID can't", LINE_1)
					lcd.string("be null", LINE_2)
					time.sleep(1)
					lcd.clear()
					lcd.string("Enter Trough ID", LINE_1)
					lcd.string("*- continue", LINE_2)
					lcd.string("#- clear D- back", LINE_3)
				else:
					break
			elif key == '#':  #for backspacing
				if len(troughID) > 0:
					troughID = troughID[:-1]
				time.sleep(0.1)
			elif key == 'D':  #return to previous menu
				return False, ""
			elif key.isdigit():
				troughID += key
				time.sleep(0.1)
			key = ""
		if validateTroughID(): # verify trough id
			return True, troughID
		else:
			lcd.clear()
			lcd.string("Trough ID is", LINE_1)
			lcd.string("    Invalid!", LINE_2)
			lcd.string("Please Try Again", LINE_3)
			time.sleep(1)

def display_screen():
	weight = 0
	while True:
		key="E"
		while key is not '*' :
			weight = displayWeight()
			key = kpad.get_key()
			if key == 'D' :
				tare()
			elif key == 'A':
				lcd.clear()
				lcd.string("       System", LINE_2)
				lcd.string("  Shutting down...", LINE_3)
				active = 0
				os.system("sudo poweroff")
				lcd.clear()
				break
			elif key == 'B':
				lcd.clear()
				lcd.string("       Script", LINE_2)
				lcd.string("     Restarting", LINE_3)
				lcd.string("   Please wait...", LINE_4)
				active = 0
				GPIO.cleanup()
				sys.stdout.flush()
				os.execv(sys.executable, ['python'] + sys.argv)
				break
			elif key == 'C':
				lcd.clear()
				lcd.string("       System", LINE_2)
				lcd.string("     Restarting", LINE_3)
				lcd.string("   Please wait...", LINE_4)
				active = 0
				os.system("sudo reboot")
				break
		if(weight<min_weight):
			continue
		else:
			return weight

def init():
	print("Initialization")
	global baseValue
	#initialize lcd
	lcd.lcd_init()
	lcd.string("      Welcome", LINE_1)
	lcd.string(" Remove any object", LINE_2)
	lcd.string(" from the platform.", LINE_3)
	time.sleep(2)
	lcd.clear()
	lcd.string("    Calibrating", LINE_1)
	lcd.string("   Please wait...", LINE_2)
	baseValue = lc.base_value()

try :
	init()
	print("Started System")
	lcd.string("Started System", LINE_1)
	data = {}	#Dictionary to store all required data
	stage = 0
	while True:
		data['weight'] = display_screen()
		while True:
			if stage==0:
				cropIDAccepted,data['cropid'] =  acceptCropID()
				if(cropIDAccepted):
					stage = 1
				else:
					break
			if stage==1:
				troughIDAccepted,data['troughid'] = acceptTroughID()
				if(troughIDAccepted):
					stage = 2
				else:
					stage = 0
					continue
			if stage==2:
				imageAccepted,data['imagename'] = takePicture()
				if(imageAccepted):
					stage = 3
				else:
					stage = 1
					continue
			if stage==3:
				storeData(data)
				stage = 0
				break
except KeyboardInterrupt:
	print("\nInterrupted by keyboard")
except Exception as e:
	print("An Exception Occured of type {0}. Arguments:\n{1!r}".format(type(e).__name__,e.args))

finally:
	lcd.clear()
	time.sleep(1)
	GPIO.cleanup()