#!/bin/bash

# EXTRACT BLOCK
echo "=== EXTRACT PHASE ==="

# Checking my current directory
pwd

# Navigate to the directory where I want to put my raw folder
cd ~/Documents/

# Create a folder to house the assignments
mkdir -p cdeassignment

#Navigate into my cdeassignment folder
cd cdeassignment

# Create my raw folder
mkdir -p raw
cd raw/

# Download the file
url="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
curl -O "$url"

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "The file downloaded successfully."
else
    echo "Failed to download file"
    exit 1
fi

# TRANSFORM BLOCK
echo ""
echo "=== TRANSFORM PHASE ==="

# I just opened the file to see the columns
head annual-enterprise-survey-2023-financial-year-provisional.csv


# Create a folder in the parent directory called transformed
mkdir -p ../transformed

# Now I am renaming the column with the provided name and selecting the needed column
# I am also saving the output of this selection in new file and saving this file in a folder called trasformed
awk -F, 'BEGIN {OFS=","} NR==1 {$6="variable_code"} {print $1, $9, $5, $6}' annual-enterprise-survey-2023-financial-year-provisional.csv > ../transformed/2023_year_finance.csv

if [ $? -eq 0 ]; then
    echo "Column replaced, selected and saved in file successfully."
else
    echo "Operation Failed"
    exit 1
fi

# LOAD BLOCK
echo ""
echo "=== LOAD PHASE ==="

# Load into the Gold directory
# Create my Gold directory in  the parent directory
mkdir -p ../gold

# To create my Gold directory and put my transformed directory in a variable
transformed_source="../transformed/2023_year_finance.csv"
gold_destination="../gold"

# Copy the transformed file to the gold directory
cp "$transformed_source" "$gold_destination/"

if [ $? -eq 0 ]; then
    echo "File saved successfully to Gold directory"
else
    echo "Failed to save file in Gold directory"
    exit 1
fi

# FINAL VERIFICATION
echo ""
echo "=== PROCESS COMPLETED ==="
echo "ETL pipeline finished successfully!"


