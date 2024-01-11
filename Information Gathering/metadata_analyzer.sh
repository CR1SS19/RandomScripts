#!/bin/bash

# Usage: ./metadata_analyzer.h <domain_name> <file_extension>

# Check for required arguments
if [ $# -ne 2 ]; then
    echo "=========================================================="
    echo " Support pdf, doc, docx, xls, xlsx, ppt, pptx"
    echo "=========================================================="
    echo " Usage: $0 <domain_name> <file_extension>"
    echo "=========================================================="
    exit 1
fi

# Search for URLs using a more reliable tool
lynx --dump "https://google.com/search?&q=site:$1+ext:$2" | grep ".$2" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' > $2.txt

# Download files
for url in $(cat $2.txt); do
    wget -q $url;
done

# Print file list and metadata
ls *.$2
exiftool *.$2 
