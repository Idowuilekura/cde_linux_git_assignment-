#!/bin/bash

# Set source and destination directories
SOURCE_DIR="/Users/user/Documents/cde_linux_git_assignment-/dera/3./files"
DEST_DIR="/Users/user/Documents/cde_linux_git_assignment-/dera/3./json_and_CSV"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Move CSV and JSON files
echo "Moving CSV and JSON files..."
find "$SOURCE_DIR" -type f \( -name "*.csv" -o -name "*.json" \) -exec mv {} "$DEST_DIR" \;

# Check if files were moved
if [ "$(ls -A "$DEST_DIR")" ]; then
    echo "Files successfully moved to $DEST_DIR"
else
    echo "No CSV or JSON files found to move"
fi