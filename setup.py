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
