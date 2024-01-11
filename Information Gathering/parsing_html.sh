#!/bin/bash

if [ "$1" == "" ]; then
    echo "Parsing HTML"
    echo "Usage: $0 <URL>"
else
    wget -q "$1" -O - | grep -o 'http[s]\?://[^"]*' | cut -d '/' -f 3 | sort -u > domains.txt
    echo ""
    echo "===================================================="
    printf "| \e[1;34m%-30s\e[0m | \e[1;32m%-15s\e[0m | \n" "Domain" "IP"
    echo "===================================================="

    while IFS= read -r domain; do
        ip=$(host "$domain" | awk '/has address/ {print $NF}')
        printf "| \e[1;34m%-30s\e[0m | \e[1;32m%-15s\e[0m | \n" "$domain" "$ip"
    done < domains.txt

    echo "===================================================="
fi