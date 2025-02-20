#!/bin/bash

# Welcome to the Mysterious Script Challenge!
# Your task is to unravel the mystery behind this script and understand what it does.
# Once you've deciphered its objective, your mission is to improve the script by adding comments and explanations for clarity.

# DISCLAIMER: This script is purely fictional and does not perform any harmful actions.
# It's designed to challenge your scripting skills and creativity.

# The Mysterious Function
mysterious_function() {
    local input_file="$1" # the input file containg the text to be processed
    local output_file="$2" # output file where result will be saved

    
    # perform a ROT transformation on input file and save result to output file 
    tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"

    # resverse content of  output  file and save to temporary file
    rev "$output_file" > "reversed_temp.txt"

    # generate random no from 1 to 10
    random_number=$(( ( RANDOM % 10 ) + 1 ))

    # Mystery loop:  repeat follwing process a random number  of times 
    for (( i=0; i<$random_number; i++ )); do
        # reverse the content of reversed_temp.txt file and save to another temporary file
        rev "reversed_temp.txt" > "temp_rev.txt"

        # apply ROT transformation to reversed content and save back to reversed_temp.txt
        tr 'A-Za-z' 'N-ZA-Mn-za-m' < "temp_rev.txt" > "temp_enc.txt"

        # move transformed file back to reversed_temp.txt for next iteration 
        mv "temp_enc.txt" "reversed_temp.txt"
    done

    # Clean up temporary files
    rm "temp_rev.txt"

    # The mystery continues...
    # The script will continue with more operations that you need to figure out!
}

# Main Script Execution

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file="$1" # assign first argument as input file
output_file="$2" # assign second argument as output file

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Call the mysterious function to begin the process
mysterious_function "$input_file" "$output_file"

# Display the mysterious output
echo "The mysterious process is complete. Check the '$output_file' for the result!"
