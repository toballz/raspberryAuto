#!/usr/bin/python3
import sys, os

arg = sys.argv
#######
for ar in arg[1:]:
 ag=ar.split("=")
##b1
 if((ag[0] == "hci") or (ag[0] == "bluetooth")):
     if((ag[1] == "sc") or (ag[1] == "scan") or (ag[1] == "discover")):
         os.system("sudo hciconfig hcix piscan")
         print("[+] make discoverable\n")
     elif((ag[1] == "nosc") or (ag[1] == "noscan")):
         os.system("sudo hciconfig hcix noscan")
         print("[+] stop discoverable\n")
     elif((ag[1] == "paired") or (ag[1] == "reconnect") or (ag[1] == "rc")):
         os.system("bluetoothctl paired-devices > ddvsci.txt")
         with open("ddvsci.txt", "r") as ping:
          for i in ping.read().strip().split("\n"):
           print(i.split(" ")[1])
           os.system("bluetoothctl --timeout=6 connect "+i.split(" ")[1])
     elif((ag[1] == "unpair") or (ag[1] == "remove") or (ag[1] == "rm")):
         os.system("bluetoothctl paired-devices > ddvsci.txt")
         with open("ddvsci.txt", "r") as ping:
          for i in ping.read().strip().split("\n"):
           print(i.split(" ")[1])
           os.system("bluetoothctl unpair "+i.split(" ")[1])
     else:
      print("!! (("+ag[1]+")) not an option for (("+ag[0]+")) \n")
 elif((ag[0] == "??") or (ag[0] == "help")):
  print('(bluetooth | hci){ \n\t[sc, scan, discover]\n\t[nosc, noscan]\n\t[paired, reconnect, rc]\n\t[unpair, np, remove, rm]\n}')
##b0
##n1
 if((ag[0] == "update") or (ag[0] == "uz")):
  os.system("sudo apt-get install bluez")
 sys.exit()


#######
if((len(arg) <= 1)):
 print("!! empty")
