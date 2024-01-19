#!/usr/bin/python

import socket

tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.connect(("192.168.0.1",21))

print "Connecting to the server..."
banner = tcp.recv(1024)
print banner

print "Sending user..."
tcp.send("USER ftp\r\n")
user = tcp.recv(1024)
print user

print "Sending password..."
tcp.send("PASS ftp\r\n")
pw = tcp.recv(1024)
print pw

print "Sending HELP command..."
tcp.send("HELP \r\n")
cmd = tcp.recv(1024)
print cmd