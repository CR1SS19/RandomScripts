import socket, sys

# Create the first socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("whois.iana.org", 43))

# Encode the query string as bytes and sand the first query
s.send(bytes(sys.argv[1]+"\r\n", encoding='utf-8')) 

# Receive and process the first response
response = s.recv(1024).split()
whois = (response[19])
print(whois.decode())

# Create the second socket
s1 = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s1.connect((whois,43))
s1.send(bytes(sys.argv[1]+"\r\n", encoding='utf-8')) # Send the second query

# Receive and print the final response
fresponse = s1.recv(1024)
print(fresponse.decode())
