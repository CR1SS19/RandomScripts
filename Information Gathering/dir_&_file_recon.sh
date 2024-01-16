#!/bin/bash

# Script to brute force url directories and files

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

for word in $(cat $2)
do
response=$(curl -s -H "User-Agent: R4TU3" -o /dev/null -w "%{http_code}" $1/$word/)

if [ $response == "200" ]
then
echo "Directory found: $1/$word/"
fi
done

