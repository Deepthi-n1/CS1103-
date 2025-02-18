#!/bin/bash
# Basic Shell Script for File Creation
# Usage: ./file_creation.sh <source_file>
# Function to display usage information
usage() {
  echo "Usage: $0 create <source_file>"
  exit 1
}

# Check if at least two arguments are provided
if [ "$#" -ne 2 ]; then
  usage
fi

operation=$1
source_file=$2

case "$operation" in
  create)
    # Create a file
    touch "$source_file"
    if [ $? -eq 0 ]; then
      echo "File '$source_file' created successfully."
    else
      echo "Error: Could not create file '$source_file'."
    fi
    ;;
  *)
    usage
    ;;
esac



