#!/bin/bash

# Database connection details
DB_NAME="posey"
DB_USER="postgres"
CSV_DIR="/Users/mac/Documents/CDE Bootcamp/Parch_and_posey"


# Iterate through each CSV file in the directory
for csv_file in "$CSV_DIR"/*.csv; do
    table_name=$(basename "$csv_file" .csv)

    echo "Processing $csv_file..."

# Creating table based on the CSV headers
   
 header=$(head -n 1 "$csv_file")
 columns=$(echo $header | sed 's/,/ text,/g' | sed 's/$/ text/')
 create_table_query="CREATE TABLE $table_name ($columns);"
    
 psql -U "$DB_USER" -d "$DB_NAME" -c "$create_table_query"

 # Importing CSV file into the table
    import_command="\copy $table_name FROM '$csv_file' CSV HEADER"
    echo "Running import command: $import_command"
    psql -U "$DB_USER" -d "$DB_NAME" -c "$import_command"
done
