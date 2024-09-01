#!/bin/bash

# Define the destination directory
destination_dir="json_csv/"

# Create the destination directory if it doesn't exist
mkdir -p "$destination_dir"

# Move all CSV files
echo "Moving CSV files..."
mv *.csv "$destination_dir"

# Move all JSON files
echo "Moving JSON files..."
mv *.json "$destination_dir"

# Check if any files were moved
if [ "$(ls -A ${destination_dir}*.csv)" ] || [ "$(ls -A ${destination_dir}*.json)" ]; then
  echo "CSV and/or JSON files successfully moved to $destination_dir."
else
  echo "No CSV or JSON files found to move."
fi
