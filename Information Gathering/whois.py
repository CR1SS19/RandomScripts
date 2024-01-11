import socket, sys

# Create the first socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("whois.iana.org", 43))

# Encode the query string as bytes before sending
query = sys.argv[1].encode("utf-8") + b"\r\n"
s.send(query) # Send the first query

# Receive and process the first response
response = s.recv(1024).decode("utf-8").split()
whois = response[19]
s.close()

# Create the second socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((whois,43))
s.send(query) # Send the second query

# Receive and print the final response
fresponse = s.recv(1024).decode("utf-8")
print(fresponse)
s.close()