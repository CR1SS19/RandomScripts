#!/bin/bash

# Usage: ./metadata_analyzer.h <domain_name> <file_extension>

# Check for required arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <domain_name> <file_extension>"
  exit 1
fi

