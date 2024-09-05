#!/bin/bash
# Set the source and destination directories
source_dir="../random"
dest_dir="../json_and_CSV"

# Create the destination directory if it doesn't exist
echo "==== Making destination directory ===="
mkdir -p "$dest_dir"

# Find all CSV and JSON files in the source directory
echo "==== Finding csv and json files in source directory ===="
find "$source_dir" -type f -name "*.csv" -o -name "*.json" | while read file; do
# Move the file to the destination directory
mv "$file" "$dest_dir"
echo "==== csv and json files moved to destination directory ===="
done