#!/usr/bin/python

import socket

if len(sys.argv) !=3:
  print "Usage: python enum_smtp.py IP user"
  sys.exit(0)

tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.connect((Sys.argv[1],25))

banner = tcp.recv(1024)
print banner
tcp.send("VRFY "+sys.argv[2]+"\r\n")
user = tcp.recv(1024)
print user