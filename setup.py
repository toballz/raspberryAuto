#!/usr/bin/python3
import sys, os

dirr=os.path.dirname(os.path.abspath(__file__))
##
print("\n[~] make exe")
os.system("sudo chmod +x "+dirr+"/ p")
print("\n[~] do updates")
os.system("sudo apt-get install bluez")
print("\n[~] copy exe")
os.system("sudo cp "+dirr+"/p /usr/local/bin/p")
print("\n[~] exe name \"p [command]\" exe\n")
if(os.path.exists("/etc/rc.local") and os.path.isfile("/etc/rc.local")):
 print("[~] edit file")
 os.system("sudo cat /etc/rc.local > "+dirr+"/rc.local")
 with open(dirr+"/rc.local", "r") as xfil:
  ctr = xfil.read().replace("exit 0", dirr+"\nexit 0")
  os.system("sudo rm /etc/rc.local")
  os.system("sudo echo "+ctr+" > "+dirr+"/rc.local")
  os.system("sudo cp "+dirr+"/rc.local /etc/rc.local")
else:
 print("[~] create file")

 os.system("sudo chmod 777 "+dirr+" | sudo chmod 777 "+dirr+"*")
 os.system("sudo echo '#!/bin/sh -e\n\nsudo bash "+dirr+"/startup.sh\n\nexit 0' >> "+dirr+"/rc.local")
 os.system("sudo cp "+dirr+"/rc.local /etc/")