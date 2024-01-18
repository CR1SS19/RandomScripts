from scapy.all import *

conf.verb = 0

print "Live Hosts"
for ip in range(1, 255):
  iprange = "192.168.0.%s" %ip
  pIP = IP(dst=iprange)
  packet = pIP/ICMP()
  resp, noresp = sr(packet,timeout=1)
  for response in resp:
    print response[1][IP].src