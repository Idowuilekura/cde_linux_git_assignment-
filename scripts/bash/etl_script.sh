#!/bin/bash

# Set environment variables
export CSV_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

# Create necessary directories
mkdir -p /Users/user/Documents/cde_linux_git_assignment-/dera/1./raw /Users/user/Documents/cde_linux_git_assignment-/dera/1./transformed/ /Users/user/Documents/cde_linux_git_assignment-/dera/1./gold/

# Extract: Download CSV file
echo "Extracting data..."
curl -o /Users/user/Documents/cde_linux_git_assignment-/dera/1./raw/annual-enterprise-survey-2023-financial-year-provisional.csv "$CSV_URL"
if [ -f /Users/user/Documents/cde_linux_git_assignment-/dera/1./raw/annual-enterprise-survey-2023-financial-year-provisional.csv ]; then
    echo "File successfully saved in raw folder."
else
    echo "Error: File not saved in raw folder."
    exit 1
fi

# Transform: Rename column and select specific columns
echo "Transforming data..."
awk -F, 'BEGIN {OFS=","} 
    NR==1 {for (i=1; i<=NF; i++) if ($i=="Variable_code") $i="variable_code"}
    {print $1,$9,$5,$6}' /Users/user/Documents/cde_linux_git_assignment-/dera/1./raw/annual-enterprise-survey-2023-financial-year-provisional.csv > /Users/user/Documents/cde_linux_git_assignment-/dera/1./transformed/2023_year_finance.csv
if [ -f /Users/user/Documents/cde_linux_git_assignment-/dera/1./transformed/2023_year_finance.csv ]; then
    echo "Transformed file saved in transformed folder."
else
    echo "Error: Transformed file not saved."
    exit 1
fi

# Load: Move transformed file to gold directory
echo "Loading data..."
mv /Users/user/Documents/cde_linux_git_assignment-/dera/1./transformed/2023_year_finance.csv /Users/user/Documents/cde_linux_git_assignment-/dera/1./gold/
if [ -f /Users/user/Documents/CDE_ASSIGNMENT/1./gold/2023_year_finance.csv ]; then
    echo "File successfully loaded into gold folder."
else
    echo "Error: File not loaded into gold folder."
    exit 1
fi

echo "ETL process completed successfully."
