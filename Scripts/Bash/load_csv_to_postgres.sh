# Define the source directory containing the CSV files
CSV_DIR="$HOME/CoreDataEngineers/LinuxGitAssignment/csv_files"

# Define the PostgreSQL connection details
DB_NAME="posey"
DB_USER="postgres"
DB_HOST="localhost"
DB_PORT="5432"

# Function to load CSV file into PostgreSQL
load_csv() {
    local file_path=$1
    local table_name=$(basename "$file_path" .csv)  # Use the CSV filename (without extension) as table name

    echo "Processing $file_path..."

    # Define table schema here
    local create_table_sql
    case "$table_name" in
        accounts)
            create_table_sql="CREATE TABLE IF NOT EXISTS accounts (
                id INT PRIMARY KEY,
                name VARCHAR(100),
                website VARCHAR(255),
                lat FLOAT,
                long FLOAT,
                primary_poc VARCHAR(100),
                sales_rep_id INT
            );"
            ;;
        orders)
            create_table_sql="CREATE TABLE IF NOT EXISTS orders (
                id INT PRIMARY KEY,
                account_id INT,
                occurred_at TIMESTAMP,
                standard_qty INT,
                gloss_qty INT,
                poster_qty INT,
                total INT,
                standard_amt_usd DECIMAL,
                gloss_amt_usd DECIMAL,
                poster_amt_usd DECIMAL,
                total_amt_usd DECIMAL
            );"
            ;;
        region)
            create_table_sql="CREATE TABLE IF NOT EXISTS region (
                id INT PRIMARY KEY,
                name VARCHAR(100)
            );"
            ;;
        sales_reps)
            create_table_sql="CREATE TABLE IF NOT EXISTS sales_reps (
                id INT PRIMARY KEY,
                name VARCHAR(100),
                region_id INT
            );"
            ;;
        web_events)
            create_table_sql="CREATE TABLE IF NOT EXISTS web_events (
                id INT PRIMARY KEY,
                account_id INT,
                occurred_at TIMESTAMP,
                channel VARCHAR(50)
            );"
            ;;
        *)
            echo "No schema defined for $table_name"
            return 1
            ;;
    esac

    # Create table if it doesn't exist
    psql -U "$DB_USER" -d "$DB_NAME" -h "$DB_HOST" -p "$DB_PORT" -c "$create_table_sql"

    # Load CSV into the PostgreSQL database
    psql -U "$DB_USER" -d "$DB_NAME" -h "$DB_HOST" -p "$DB_PORT" -c "\COPY $table_name FROM '$file_path' DELIMITER ',' CSV HEADER;"

    # Check if the command was successful
    if [ $? -eq 0 ]; then
        echo "Successfully loaded $file_path into the table $table_name."
    else
        echo "Failed to load $file_path. Check the file format and database permissions."
    fi
}

# Iterate over each CSV file in the source directory
for csv_file in "$CSV_DIR"/*.csv; do
    # Skip iteration if no CSV files are found
    if [ ! -f "$csv_file" ]; then
        echo "No CSV files found in the directory."
        break
    fi

    # Load each CSV file into the PostgreSQL database
    load_csv "$csv_file"
done

echo "All CSV files processed."
