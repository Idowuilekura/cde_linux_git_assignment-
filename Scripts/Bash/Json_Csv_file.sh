#!/bin/bash

#Defining the source and destination directories
Source_Directory="/Users/mac/Documents/CDE Bootcamp"
Destination_Directory="/Users/mac/Documents/CDE Bootcamp/json_and_CSV"

# Creating the Destination directory
mkdir -p "$Destination_Directory"

# Move all CSV files to the destination directory
echo "Moving CSV files..."
mv "$Source_Directory"/*.csv "$Destination_Directory/"

# Move all JSON files to the destination directory
echo "Moving JSON files..."
mv "$Source_Directory"/*.json "$Destination_Directory/"

echo "All CSV and JSON files have been moved to $Destination_Directory."

