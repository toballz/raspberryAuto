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
 with open("/etc/rc.local", "r") as xfil:
  xfil.read().replace("exit 0", dirr+"\nexit 0")
else:
 print("[~] create file")
 os.system("sudo rm ./rc.local")
 os.system("sudo echo '#!/bin/sh -e\n\nbash "+dirr+"/startup.sh\n\nexit 0' >> ./rc.local")
 os.system("sudo cp ./rc.local /etc/")
