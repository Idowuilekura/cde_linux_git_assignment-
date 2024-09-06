#Project Question and overview
You have been hired as a new Data Engineer at CoreDataEngineers. Your task is to manage the company’s data infrastructure 
by building a Bash script to perform a simple ETL (Extract, Transform, Load) process.
 The project involves:
- Downloading and saving a CSV file.
- Transforming it by renaming a column and selecting specific fields.
- Loading the transformed file into designated folders.

 Task 1: Bash Script for ETL Process

Extraction:
- A CSV file was downloaded from a given URL and saved it into a folder named `raw`.

Transforming:
- The column was renamed to `Variable_code` to `variable_code`.
- These columns was selected: `year`, `Value`, `Units`, `variable_code`.
- It was then saved as `2023_year_finance.csv` in a folder called `Transformed`.

Loading:
- The transformed file was saved  into a folder named `Gold`.

Cron Job:
- The script was scheduled to run daily at 12:00 AM using a cron job.

Task 2: Move CSV and JSON Files
Write a Bash script that moves all CSV and JSON files from one folder to another folder named `json_and_CSV`. The script should work with one or more 
files of either type.
-All CSV and JSON files were moved from one folder to another folder named json_and_CSV.
-The script works for one or multiple CSV and JSON files.


Task 3: Load CSV Files into PostgreSQL
 Write a Bash script to iterate over CSV files and copy them into a PostgreSQL database (name the database `posey`).
-A Bash script was written to iterate over CSV files and copy them into the PostgreSQL database (posey).
-The script ensured each CSV file was loaded successfully into the database

Task 4:Involves witting SQL Queries for Data Analysis

