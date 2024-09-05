# step 1: Extract
## Set environment variables

CSV_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"  # URL of the CSV file
RAW_DIR="$HOME/CoreDataEngineers/LinuxGitAssignment/raw"  # Corrected path to save the file

## Download the CSV File
echo "Extracting data..."
wget -q "$CSV_URL" -O "$RAW_DIR/annual-enterprise-survey-2023-financial-year-provisional.csv"  # Download and save the file

## Confirm file download
if [[ -f "$RAW_DIR/annual-enterprise-survey-2023-financial-year-provisional.csv" ]]; then 
echo "File successfully downloaded to the raw folder." 
else 
echo "Error: File not found in the raw folder." 
exit 1 
fi


## Transformation
echo "Transforming data..."

## Create the Transformed directory if it doesn't exist
mkdir -p "$RAW_DIR/../Transformed"

## Rename the column and select specific columns
awk 'BEGIN{FS=OFS=","} NR==1{$0="year,Value,Units,variable_code"; print} NR>1{print}' "$RAW_DIR/annual-enterprise-survey-2023-financial-year-provisional.csv" > "$RAW_DIR/temp_file.csv"

## Select the specific columns and save to the final file
awk -F"," '{print $1","$2","$3","$4}' "$RAW_DIR/temp_file.csv" > "$RAW_DIR/2023_year_finance.csv"

## Move the transformed file
mv "$RAW_DIR/2023_year_finance.csv" "$RAW_DIR/../Transformed/"

## Confirm the file has been moved
if [[ -f "$RAW_DIR/../Transformed/2023_year_finance.csv" ]]; then
    echo "File successfully transformed and saved to the Transformed folder."
else
    echo "Error: File not found in the Transformed folder."
    exit 1
fi


# Step 3: Load - Move the transformed data to the Gold directory
echo "Loading data..."
mv "$RAW_DIR/../Transformed/2023_year_finance.csv" "$RAW_DIR/../Gold/"

## Confirm loading
if [[ -f "$RAW_DIR/../Gold/2023_year_finance.csv" ]]; then
    echo "File successfully loaded into the Gold folder."
else
    echo "Error: File not loaded into the Gold folder."
    exit 1
fi

echo "ETL Process Completed Successfully!"

## Notify via email after script execution
# if [ "$?" -eq 0 ]; then
#   echo "ETL script ran successfully on $(date)" | mail -s "ETL Job Success" nnamanichisomnc@gmail.com
# else
#   echo "ETL script failed on $(date)" | mail -s "ETL Job Failed" nnamanichisomnc@gmail.com
# fi
