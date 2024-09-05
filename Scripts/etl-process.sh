#!/bin/bash

echo "==== Starting extraction process ===="
cd ..
echo "==== Making raw directory ===="
mkdir -p raw
echo "==== Starting curl process ===="
cd raw && { curl -O https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv ; }

echo "==== End of extraction process ===="


echo "==== Starting transformation process ===="

# Renaming Column
sed -i '1s/Variable_code/variable_code/' annual-enterprise-survey-2023-financial-year-provisional.csv

#Selecting specific columns
awk -F, '{print $1, $5, $6, $9}' annual-enterprise-survey-2023-financial-year-provisional.csv > 2023_year_finance.csv

# Save in a new folder - Transformed
mkdir -p ../Transformed
mv 2023_year_finance.csv ../Transformed

echo "==== End of transformation process ===="


echo "==== Starting load process ===="

# Create Gold directory
mkdir -p ../Gold

# Move the transformed file to the Gold directory
mv ../Transformed/2023_year_finance.csv ../Gold

# Confirm that the file has been saved into the Gold folder
if [ -f "../Gold/2023_year_finance.csv" ]; then
    echo "File successfully moved to Gold directory."
else
    echo "File move to Gold directory failed."
fi

echo "==== End of load process ===="



echo "==== Schedule a cron job to run everyday at 12:00am ===="



