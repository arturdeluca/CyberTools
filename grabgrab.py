
# Tool to get banners from  services

# Disclamer:
# This tool was created to be used in controled environments only
# The creator is not responsible for the usage of the tool with malicious intent


import socket
import sys

print("")
print("╔═╗╦═╗╔═╗╔╗   ╔═╗╦═╗╔═╗╔╗ ")
print("║ ╦╠╦╝╠═╣╠╩╗  ║ ╦╠╦╝╠═╣╠╩╗")
print("╚═╝╩╚═╩ ╩╚═╝  ╚═╝╩╚═╩ ╩╚═╝")
print("     Creator: s4rTu")
print("")

if len(sys.argv) == 3:

	mysocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	mysocket.connect((sys.argv[1],int(sys.argv[2])))
	banner = mysocket.recv(1024)

	print(banner)

else:

	print("Wrong Arguments")
	print("Usage: python3 grabgrab.py IP PORT")
