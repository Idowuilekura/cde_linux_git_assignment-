

### Explanation

1. **Environment Variable:**
   - The URL of the CSV file is stored in an environment variable `CSV_URL` to make the script more flexible and reusable.

2. **Extraction:**
   - The script creates a `raw` directory if it doesn't exist.
   - It then downloads the CSV file into this directory using `curl`.
   - The script checks if the file has been successfully downloaded and saved.

3. **Transformation:**
   - The script creates a `Transformed` directory.
a. **Extracting and Renaming the Header:**
   - The `head -n 1` command extracts the first line (the header) of the CSV file.
   - The `sed 's/Variable_code/variable_code/'` command replaces `Variable_code` with `variable_code` in the header string.

b. **Extracting the Data:**
   - The `tail -n +2` command extracts the data starting from the second line (skipping the header) and saves it in a temporary file `temp_data.csv`.

c. **Combining the Header and Data:**
   - The `cut -d',' -f1,2,3,4` command selects the first four columns (`year`, `Value`, `Units`, `variable_code`) from the data in the temporary file.
   - The `echo "$header"` command adds the modified header back to the beginning of the file, and the combined result is saved as `2023_year_finance.csv`.

d. **Cleanup:**
   - The temporary file `temp_data.csv` is deleted after the transformation is complete to keep the workspace clean.

4. **Loading:**
   - The script creates a `Gold` directory.
   - It copies the transformed file into the `Gold` directory.
   - The script checks if the file has been successfully moved.

5. **Orchestration Using Crontab:**
   - The script includes comments to explain each step.
   - It also prints out messages to inform the user about the status of each process.



To schedule the scripts to run daily at 12:00 AM using cron jobs.

### Explanation:
- `0 0 * * *`: This specifies the time when the cron job should run. It means "run at 12:00 AM every day."
- `>> logs/etl_script.sh.log 2>&1`: This redirects the standard output and error output of the script to a log file.


Here’s a Bash script that will move all `.csv` and `.json` files from one folder to another folder named `json_and_CSV`. The script is designed to handle one or more files of each type:

```bash
#!/bin/bash

# Define source and destination directories
source_dir="/path/to/source_folder"
destination_dir="/path/to/json_and_CSV"

# Create the destination directory if it doesn't exist
mkdir -p "$destination_dir"

# Move all CSV files
echo "Moving CSV files..."
mv "$source_dir"/*.csv "$destination_dir"/ 2>/dev/null

# Move all JSON files
echo "Moving JSON files..."
mv "$source_dir"/*.json "$destination_dir"/ 2>/dev/null

# Check if any files were moved
if [ "$(ls -A $destination_dir/*.csv 2>/dev/null)" ] || [ "$(ls -A $destination_dir/*.json 2>/dev/null)" ]; then
  echo "CSV and/or JSON files successfully moved to $destination_dir."
else
  echo "No CSV or JSON files found in $source_dir to move."
fi
```

### Explanation:

1. **Source and Destination Directories:**
   - The script starts by defining the `source_dir`, which is the directory from where you want to move the files, and the `destination_dir`, which is the directory where you want the files to be moved. Replace `/path/to/source_folder` and `/path/to/json_and_CSV` with the actual paths.

2. **Create the Destination Directory:**
   - The `mkdir -p "$destination_dir"` command creates the destination directory if it doesn't already exist.

3. **Move CSV Files:**
   - The script uses `mv "$source_dir"/*.csv "$destination_dir"/` to move all `.csv` files from the source directory to the destination directory.
   - `2>/dev/null` is used to suppress any error messages if no `.csv` files are found.

4. **Move JSON Files:**
   - Similarly, `mv "$source_dir"/*.json "$destination_dir"/` moves all `.json` files, with errors suppressed if no `.json` files are present.

5. **Check if Files Were Moved:**
   - The script checks if any `.csv` or `.json` files are present in the destination directory after the move. If files were moved, it prints a success message; otherwise, it indicates that no files were found to move.

### Usage:

1. Save the script as `move_files.sh`.
2. Make the script executable:

   ```bash
   chmod +x move_files.sh
   ```

3. Run the script:

   ```bash
   ./move_files.sh
   ```

This script will work with any number of `.csv` and `.json` files, moving them from the specified source directory to the `json_and_CSV` directory.