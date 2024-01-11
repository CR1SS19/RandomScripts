#!/bin/bash

# Usage: ./reverse_dns.sh 10.80.23

for ip in $(seq 224 239);do
host -t ptr $1.$ip | grep -v "$1" | cut -d " " -f 5