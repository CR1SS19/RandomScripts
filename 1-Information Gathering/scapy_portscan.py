import sys
from scapy.all import *

conf.verb = 0

ports = [21,22,23,25,80,443,110]

pIP = IP(dst=sys.argv[1])
pTCP = TCP(dport=ports,flags="S")
packet = pIP/pTCP
resp, noresp = sr(packet)
for response in resp:
  port = response[1][TCP].sport
  flag = response[1][TCP].flags
  if (flag == "SA"):
    print "Port %d OPEN" %(port)
