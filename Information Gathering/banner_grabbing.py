#!/usr/bin/python3
import socket

ip = input("Enter the ip: ")
port = int(input("Enter the port: "))

mysock = socket .socket(socket.AF_INET, socket.SOCK_STREAM)
mysock.connect((ip,port))
banner = mysock.recv(1024)
print(banner)