#!/usr/bin/env bash

# Load environment variables from .env file
source .env

# Create directories if they don't exist
mkdir -p $RAW_DIR $TRANSFORMED_DIR $GOLD_DIR

# Extract: Download the CSV file
echo "Starting Extraction Process..."
curl -o $RAW_DIR/data.csv $CSV_URL

if [ -f "$RAW_DIR/data.csv" ]; then
  echo "File downloaded successfully to $RAW_DIR"
else
  echo "Failed to download file."
  exit 1
fi

# Transform: Process the CSV file
echo "Starting Transformation Process..."

# Rename and select columns using awk

awk -F',' 'NR==1 {gsub("Variable_code", "variable_code"); print $1","$9","$5","$6} NR>1 {print $1","$9","$5","$6}' $RAW_DIR/data.csv > $TRANSFORMED_DIR/2023_year_finance.csv

if [ -f "$TRANSFORMED_DIR/2023_year_finance.csv" ]; then
  echo "File transformed successfully and saved to $TRANSFORMED_DIR"
else
  echo "Transformation failed."
  exit 1
fi


echo "File is being loaded into Gold"
if [ -f "$TRANSFORMED_DIR/2023_year_finance.csv" ]; then
    # load the file to the destination directory
    cp "$TRANSFORMED_DIR/2023_year_finance.csv" "$GOLD_DIR/"
    
    # Check if the file was successfully loaded
    if [ -f "$GOLD_DIR/2023_year_finance.csv" ]; then
        echo "File loaded successfully to $GOLD_DIR"
    else
        echo "Failed to load the file."
    fi
else
    echo "Source file does not exist."
fi

mkdir -p $DEST_DIR

# Move CSV and JSON files
mv $SOURCE_DIR/*.csv $DEST_DIR/
mv $SOURCE_DIR/*.json $DEST_DIR/

echo "All CSV and JSON files have been moved to $DEST_DIR."

# Get the full path of the current script
SCRIPT_PATH="$(realpath "$0")"

# Schedule the cron job to run this script at 12:00 AM daily
(crontab -l 2>/dev/null; echo "0 0 * * * $SCRIPT_PATH") | crontab -

echo "Cron job scheduled to run this script at 12:00 AM daily."
