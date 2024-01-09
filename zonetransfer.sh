#!/bin/bash

# Usage: ./zonetransfer.sh <domain_name>

# Check for required argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <domain_name>"
  exit 1
fi

# Get nameservers for the domain
nameservers=$(host -t ns "$1" | cut -d " " -f 4)

# Iterate through nameservers and perform zone transfers
for server in $nameservers; do
  echo "Attempting zone transfer from $server..."
  host -l -a "$1" "$server"

  # Check for errors in zone transfer
  if [ $? -ne 0 ]; then
    echo "Zone transfer from $server failed."
  else
    echo "Zone transfer from $server successful."
  fi
done
