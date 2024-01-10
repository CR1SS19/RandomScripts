#!/usr/bin/python3
import socket,sys

# Usage: python3 dns_resolver.py example.com
host = sys.argv[1]

print(host,"=====>",socket.gethostbyname(host))