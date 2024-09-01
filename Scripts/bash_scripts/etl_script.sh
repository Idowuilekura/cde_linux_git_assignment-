#!/bin/bash

# Set environment variable for the CSV file URL
export CSV_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"



# Step 1: Extract
echo "Starting the extraction process..."

# Create a raw directory if it doesn't exist
mkdir -p raw

# Download the CSV file and save it in the raw directory
curl -o raw/annual-enterprise-survey-2023-financial-year-provisional.csv $CSV_URL

# Confirm that the file has been saved in the raw directory
if [[ -f "raw/annual-enterprise-survey-2023-financial-year-provisional.csv" ]]; then
  echo "File successfully downloaded and saved in the raw folder."
else
  echo "Failed to download the file."
  exit 1
fi



# Step 2: Transform
echo "Starting the transformation process..."

# Create a Transformed directory if it doesn't exist
mkdir -p Transformed

# Extract the header and replace Variable_code with variable_code using sed
header=$(head -n 1 raw/annual-enterprise-survey-2023-financial-year-provisional.csv | sed 's/Variable_code/variable_code/')

# Extract the data without the header
tail -n +2 raw/annual-enterprise-survey-2023-financial-year-provisional.csv > temp_data.csv

# Combine the modified header and the data, selecting only the required columns
{
  echo "$header" | cut -d',' -f1,2,3,4
  cut -d',' -f1,2,3,4 temp_data.csv
} > Transformed/2023_year_finance.csv

# Remove the temporary data file
rm temp_data.csv

# Confirm that the transformed file has been saved
if [[ -f "Transformed/2023_year_finance.csv" ]]; then
  echo "Transformation complete. File saved in the Transformed folder."
else
  echo "Transformation failed."
  exit 1
fi



# Step 3: Load
echo "Starting the load process..."

# Create a Gold directory if it doesn't exist
mkdir -p Gold

# Move the transformed file to the Gold directory
cp Transformed/2023_year_finance.csv Gold/

# Confirm that the file has been loaded into the Gold directory
if [[ -f "Gold/2023_year_finance.csv" ]]; then
  echo "File successfully loaded into the Gold folder."
else
  echo "Failed to load the file into the Gold folder."
  exit 1
fi

echo "ETL process completed successfully!"



# Step 4: Add the cron job
echo "Scheduling the script to run daily at 12:00 AM..."

# Get the current script path
script_path="$(etl_script.sh "$0")"

# Check if the cron job already exists
(crontab -l | grep -F "$script_path") || (crontab -l ; echo "0 0 * * * $script_path >> logs/etl_script.log 2>&1") | crontab -

echo "Cron job added successfully!"