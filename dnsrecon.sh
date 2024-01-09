#!/bin/bash

# Use ./dnsrecon.sh example.com list.txt

for word in $(cat $2);
do 
host $word.$1 | grep -v "NXDOMAIN"
done