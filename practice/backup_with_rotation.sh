#!/bin/bash

<<note
This script takes a backup of any destination path given in argument.
Usage: ./backup_with_rotation.sh /path/to/directory
note

# Function to show the current date
function show_date {
    echo "Today is: $(date '+%Y-%m-%d %H-%M-%S')"
}

# Function to create a backup
function create_backup {
    timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
    backup_dir="$1/backup_$timestamp"

    # Create the backup directory
    mkdir -p "$backup_dir"

    # Copy all files from the source directory to the backup directory
    cp -r "$1/"* "$backup_dir/"

    echo "Backup Complete: $backup_dir"

    # Rotate backups
    rotate_backup "$1"
}

# Function to rotate backups
function rotate_backup {
    local source_dir="$1"
    local max_backup=3

    # Count the number of backup directories
    backup_count=$(ls -1d "$source_dir"/backup_* 2>/dev/null | wc -l)

    # If the number of backups exceeds the maximum, delete the oldest
    if [ "$backup_count" -gt "$max_backup" ]; then
        echo "Rotating backups: deleting oldest backups..."

        # List backup directories sorted by modification time and delete the oldest ones
        ls -1dt "$source_dir"/backup_* | tail -n +$((max_backup + 1)) | xargs rm -rf

        echo "Old backups deleted."
    fi
}

# Show the current date
show_date

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_backup>"
    exit 1
fi

# Check if the provided argument is a valid directory
if [ ! -d "$1" ]; then
    echo "Error: Directory '$1' does not exist."
    exit 1
fi

# Create the backup
create_backup "$1"
