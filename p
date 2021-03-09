#!/usr/bin/python3
import sys, os

arg = sys.argv

for ar in arg:
 ag=ar.split("=")
 if((ag[0] == "hci") or (ag[0] == "bluetooth")):
     if((ag[1] == "sc") or (ag[1] == "scan")or (ag[1] == "discover")):
         os.system("sudo hciconfig hcix piscan")
         print("[+] make discoverable\n")
     elif((ag[1] == "nosc") or (ag[1] == "noscan")):
         os.system("sudo hciconfig hcix noscan")
         print("[+] stop discoverable\n")
     elif((ag[1] == "paired") or (ag[1] == "reconnect") or (ag[1] == "autoconnect")):
         os.system("bluetoothctl paired-devices > ddvsci.txt")
         with open("ddvsci.txt", "r") as ping:
          for i in ping.read().strip().split("\n"):
           print(i.split(" ")[1])
           os.system("bluetoothctl --timeout=6 connect "+i.split(" ")[1])
     else:
      print("!! not an option\n")
