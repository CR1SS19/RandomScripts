#!/bin/bash

# Usage: ./dnsrecon.sh <domain_name> <wordlist_file>

# Check for required arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <domain_name> <wordlist_file>"
  exit 1
fi

# Check if wordlist file exists
if [ ! -f "$2" ]; then
  echo "Error: Wordlist file $2 not found."
  exit 1
fi

# Iterate through words in the wordlist
while read -r word; do
  host "$word.$1" | grep -v "NXDOMAIN"
done < "$2"