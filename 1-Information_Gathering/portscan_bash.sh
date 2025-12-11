#!/bin/bash

# Checks if the user has root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run with root privileges."
    exit 1
fi

# Gets the IP address of the target host
host=$1
if [[ -z $host ]]; then
    echo "You must specify the IP address of the target host."
    exit 1
fi

# Gets the range of ports to scan
ports=$2
if [[ -z $ports ]]; then
  ports="1-65535"
fi

# Scan the ports
for port in $ports; do
  # Sends a SYN packet
  sock=$(socket -so -d -t -u -a $host -p $port)

  # Check the answer
  if [ -z $sock ]; then
    echo "Port $port: closed"
  elif [ $? -eq 1 ]; then
    echo "Port $port: filtered"
  else
    echo "Port $port: open"
  fi

  # Close the socket
  close $sock
done