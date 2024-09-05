#!/bin/bash

# Set PostgreSQL connection details
PG_HOST="localhost"
PG_PORT="5432"
PG_DB="posey"
PG_USER="Dom"
PG_PASSWORD="Dera2010$"
CONTAINER_NAME="cde1_postgres"

# Directory containing CSV files
CSV_DIR="/Users/user/Documents/cde_linux_git_assignment-/dera/data"

# Iterate over CSV files and import them
for csv_file in "$CSV_DIR"/*.csv; do
    table_name=$(basename "$csv_file" .csv)
    echo "Importing $csv_file into table $table_name..."

    # Extract the first line (header) to get the column names
    header=$(head -n 1 "$csv_file")
    
    # Replace commas with SQL-compatible column definitions (e.g., "column_name TEXT")
    columns=$(echo $header | sed 's/,/ TEXT,/g')" TEXT"

    # Create table and import data using Docker to run the psql command
    docker exec -e PGPASSWORD=$PG_PASSWORD $CONTAINER_NAME psql -U $PG_USER -d $PG_DB <<EOF
    CREATE TABLE IF NOT EXISTS $table_name (
        $columns
    );
    
    \COPY $table_name FROM '$csv_file' WITH CSV HEADER;
EOF

    if [ $? -eq 0 ]; then
        echo "Successfully imported $csv_file"
    else
        echo "Error importing $csv_file"
    fi
done

echo "Data import completed."
