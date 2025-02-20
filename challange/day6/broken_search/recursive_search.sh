#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
  echo "Usage: ./recursive_search.sh <directory> <target_file>"
  exit 1
fi

search_directory=$1
target_file=$2

# Check if the specified directory exists
if [ ! -d "$search_directory" ]; then
  echo "Error: Directory '$search_directory' does not exist."
  exit 1
fi

# Perform the recursive search for the target file
found_file=$(find "$search_directory" -type f -name "$target_file" -print -quit)

# Check if the file was found
if [ -n "$found_file" ]; then
  echo "File found: $found_file"
else
  echo "File not found: $target_file"
  exit 1
fi
