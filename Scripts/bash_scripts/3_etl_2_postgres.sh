#!/bin/bash

# automatically export all db credentials from environment variables
set -a
source .env
set +a

echo $DB_NAME
echo $DB_USER
echo $DB_HOST
echo $DB_PORT
echo $RAW_FOLDER

# Directory containing CSV files (change if needed)
echo "clone repo containing raw files"
git clone https://github.com/jdbarillas/parchposey.git
echo "switch to the directory containing the CSVs"
#cd parchposey/data-raw

# Directory containing the CSV files from the cloned repo
CSV_DIR="./parchposey/data-raw"

echo "export password so psql does not prompt"
export PGPASSWORD="$DB_PASS"

# Iterate over all CSV files in the directory
#for file in "$CSV_DIR"/*.csv; do
    # Extract table name from file (remove path and extension)
    #table_name=$(basename "$file" .csv)

    #echo "Importing $file into table $table_name..."

    # Drop table if it already exists (optional, ensures clean import)
    #psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" \
    #    -c "DROP TABLE IF EXISTS \"$table_name\" CASCADE;"

    # Create table dynamically using the CSV header (all columns as text)
    #header=$(head -n 1 "$file" | sed 's/"/""/g; s/,/ text, /g; s/$/ text/')
    #psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" \
    #    -c "CREATE TABLE \"$table_name\" ($header);"

    # Import CSV into PostgreSQL
#    psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" \
#        -c "\COPY \"$table_name\" FROM '$file' CSV HEADER;"
#done

#echo "All CSV files imported successfully into database '$DB_NAME'."



# Iterate over all CSV files in the directory
for file in "$CSV_DIR"/*.csv; do
    # Extract table name from filename (remove path + .csv extension)
    table_name=$(basename "$file" .csv)

    echo "Importing $file into existing table $table_name..."

    # Import CSV into PostgreSQL (table must already exist)
    psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" \
        -c "\COPY \"$table_name\" FROM '$file' CSV HEADER;"
    
    echo "$table_name ingested"
done

echo " All CSV files ingested successfully into existing tables in '$DB_NAME'."