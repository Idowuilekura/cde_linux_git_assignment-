#!/bin/bash

# Source and destination folders
set -a             # automatically export all variables
source .env
set +a

echo $SRC_FOLDER
echo $DST_FOLDER

# Create destination if it doesn't exist
echo "checking if there is an existing destination folder"
if [ -d "$DST_FOLDER" ]; then
    echo "Destination folder exists, removing..."
    rm -rf "$DST_FOLDER"
    echo "Destination folder removed"
else
    echo "Destination folder does not exist"
fi

echo "create a folder named, 'raw' "
mkdir $DST_FOLDER

echo "moving files from source folder to destination folder"
mv "$SRC_FOLDER"/*.csv "$SRC_FOLDER"/*.json "$DST_FOLDER" 2>/dev/null

echo "All CSV and JSON files moved from $DST_FOLDER to $DST_FOLDER"
