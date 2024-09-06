#!/bin/bash

# Defining the CSV URL as an environment variable
CSV_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

# Downloading the CSV file from the provided website and creating the raw folder to save it
echo "Downloading the CSV file..."
mkdir -p raw
wget -O raw/annual-enterprise-survey-2023-financial-year-provisional.csv $CSV_URL

# Renaming the column 'Variable_code' to 'variable_code'
echo "Renaming the column 'Variable_code' to 'variable_code'..."
mkdir -p Transformed
sed 's/Variable_code/variable_code/' raw/annual-enterprise-survey-2023-financial-year-provisional.csv > raw/survey_data.csv


#Selecting the specific columns Year, Value, Units, variable_code to be saved into the Transformed folder
echo "Selecting 'Year', 'Value', 'Units', and 'variable_code' columns..."
csvcut -c Year,Value,Units,variable_code raw/survey_data.csv > Transformed/2023_year_finance.csv

# Moving the transformed file into the Gold folder
echo "Moving the transformed file into the Gold folder..."
mkdir -p Gold
cp Transformed/2023_year_finance.csv Gold/

echo "ETL process is complete."

