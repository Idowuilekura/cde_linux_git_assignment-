#!/bin/bash

## Clone the parch and posey repository
if [ ! -d "parchposey" ]; then
    echo "Cloning the repository..."
    git clone https://github.com/jdbarillas/parchposey
else
    echo "Repository already exists - skipping clone"
fi

## Create my postgres Database and handle errors
echo "Creating posey database..."
if psql -h localhost -p 5432 -U airflow -d template1 -c "CREATE DATABASE posey;"; then
    echo "Database Created Successfully"
else 
    echo "Database already exists"
fi   

# Database connection settings 
db_host="localhost"
db_port="5432" 
db_name="posey"
db_user="airflow"
db_password="airflow" 

## Iterate over the csv and load the files into the posey DB
source_dir="./parchposey"

echo "Starting CSV loading process..."
echo "Loading from: $source_dir"
echo "Target database: $db_name on $db_host"

# Check if my project folder already exists
if [ ! -d "$source_dir" ]; then
    echo "Error: Folder not found: $source_dir"
    echo "Please check the repository was cloned correctly"
    exit 1
fi

# Check if there are any CSV files to work with
echo "Searching for CSV files..."
if ! find "$source_dir" -name "*.csv" -type f -print0 | grep -q .; then
    echo "Error: No CSV files found in the project folder"
    echo "Please check that files were downloaded correctly"
    exit 1
fi

echo "CSV files found. Starting data loading..."

# Keep track of how many files work and how many don't
success_count=0
fail_count=0

# Process each CSV file found in the repository
while IFS= read -r -d '' csv_file; do
    # Get a clean name for the database table
    filename=$(basename "$csv_file" .csv)
    table_name=$(echo "$filename" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr '-' '_')
    
    echo "Processing: $filename.csv"
    echo "File location: $csv_file"
    echo "Target table: $table_name"
    
    # Convert relative path to absolute path for PostgreSQL
    csv_file_absolute=$(realpath "$csv_file")
    
    # First try to load directly into existing table
    if PGPASSWORD="$db_password" psql -h "$db_host" -p "$db_port" -U "$db_user" -d "$db_name" \
        -c "\copy $table_name FROM '$csv_file_absolute' WITH (FORMAT csv, HEADER true, DELIMITER ',');" 2>/dev/null; then
        echo "Success: Loaded $filename.csv into existing table"
        ((success_count++))
    else
        echo "Table doesn't exist or other issue. Creating new table..."
        
        # Read the header row from the CSV to create proper columns
        header=$(head -n 1 "$csv_file_absolute")
        
        # Build column definitions based on CSV header
        columns=""
        IFS=',' read -ra field_names <<< "$header"
        for field in "${field_names[@]}"; do
            clean_field=$(echo "$field" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr '-' '_' | tr -cd '[:alnum:]_')
            columns+="$clean_field TEXT,"
        done
        columns="${columns%,}"  # Remove trailing comma
        
        # First create the table with proper columns
        if PGPASSWORD="$db_password" psql -h "$db_host" -p "$db_port" -U "$db_user" -d "$db_name" \
            -c "CREATE TABLE IF NOT EXISTS $table_name ($columns);" 2>/dev/null; then
            echo "Table $table_name created with columns: $(echo $columns | tr ',' ' ')"
            
            # Then load the data into the newly created table
            if PGPASSWORD="$db_password" psql -h "$db_host" -p "$db_port" -U "$db_user" -d "$db_name" \
                -c "\copy $table_name FROM '$csv_file_absolute' WITH (FORMAT csv, HEADER true, DELIMITER ',');" 2>/dev/null; then
                echo "Success: Data loaded into $table_name"
                ((success_count++))
            else
                echo "Error: Failed to load data into $table_name"
                echo "Trying to show the actual error:"
                PGPASSWORD="$db_password" psql -h "$db_host" -p "$db_port" -U "$db_user" -d "$db_name" \
                    -c "\copy $table_name FROM '$csv_file_absolute' WITH (FORMAT csv, HEADER true, DELIMITER ',');" 2>&1 | head -5
                ((fail_count++))
            fi
        else
            echo "Error: Failed to create table $table_name"
            echo "Trying to show the actual error:"
            PGPASSWORD="$db_password" psql -h "$db_host" -p "$db_port" -U "$db_user" -d "$db_name" \
                -c "CREATE TABLE IF NOT EXISTS $table_name ($columns);" 2>&1 | head -5
            ((fail_count++))
        fi
    fi
    echo "----------------------------------------"
done < <(find "$source_dir" -name "*.csv" -type f -print0)

# Show final results
echo "Data loading process completed!"
echo "Summary:"
echo "  Successfully loaded: $success_count files"
echo "  Failed to load: $fail_count files"

if [ $success_count -eq 0 ]; then
    echo ""
    echo "Troubleshooting tips:"
    echo "  • Check if PostgreSQL is running: docker ps"
    echo "  • Verify database credentials are correct"
    echo "  • Check CSV file format and headers"
    echo "  • Try loading one file manually to see detailed errors:"
    echo "    PGPASSWORD=airflow psql -h localhost -p 5432 -U airflow -d posey -c \"\copy tablename FROM './parchposey/data-raw/filename.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');\""
fi

echo "Finished processing all CSV files for database: $db_name"