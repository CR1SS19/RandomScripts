#!/usr/bin/python3
import socket,sys

# Usage: python3 portscan_python.py 192.168.10.10
for port in range(1,65535):
    mysock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    if mysock.connect_ex((sys,argv[1],port)) == 0:
        print("Port",port,"[OPEN]")
        mysock.close()