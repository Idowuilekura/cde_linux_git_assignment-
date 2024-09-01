#!/bin/bash

# Set database variables
DB_NAME="posey"
DB_USER="postgres" 
DB_HOST="localhost"      
DB_PORT="5432"           

# Set directory containing CSV files
CSV_DIR="sql/data"

# Iterate over each CSV file in the directory
for csv_file in "$CSV_DIR"/*.csv; do
  # Extract the base name of the CSV file (e.g., orders.csv -> orders)
  table_name=$(basename "$csv_file" .csv)

  # Copy the data from the CSV file into the PostgreSQL table
  psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -c "\COPY $table_name FROM '$csv_file' WITH CSV HEADER"
  
  # Check if the copy command was successful
  if [ $? -eq 0 ]; then
    echo "Successfully imported $csv_file into $table_name table."
  else
    echo "Failed to import $csv_file."
  fi
done

