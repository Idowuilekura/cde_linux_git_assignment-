
```markdown
# SQL, ETL and Linux Data Analysis Project

This project involves tasks given to test understanding of SQL, ETL and linux scripting. The tasks were accomplished using a combination of Bash scripting and SQL queries on a PostgreSQL database.

## Table of Contents

- [Project Description](#project-description)
- [Requirements](#requirements)
- [Task 1: Bash Script for ETL Process](#task-1-bash-script-for-etl-process)
- [Task 2: SQL Queries](#task-2-sql-queries)
  - [Query 1: Order IDs where gloss_qty or poster_qty > 4000](#query-1-order-ids-where-gloss_qty-or-poster_qty--4000)
  - [Query 2: Orders with standard_qty = 0 and gloss_qty or poster_qty > 1000](#query-2-orders-with-standard_qty--0-and-gloss_qty-or-poster_qty--1000)
  - [Query 3: Company names starting with 'C' or 'W', primary contact contains 'ana' but not 'eana'](#query-3-company-names-starting-with-c-or-w-primary-contact-contains-ana-but-not-eana)
  - [Query 4: Region, Sales Rep, and Account Names](#query-4-region-sales-rep-and-account-names)
- [Cron Job Setup](#cron-job-setup)
- [Architecture Diagram](#architecture-diagram)
- [How to Run the Scripts](#how-to-run-the-scripts)

## Project Description

The project aims to extract, transform, and load (ETL) data from a CSV file into a PostgreSQL database, followed by executing SQL queries to generate insights as requested by the business.

## Requirements

- **PostgreSQL** for database management.
- **Bash** for scripting.
- **Cron** for scheduling automated tasks.
- **Git** for version control.

## Task 1: Bash Script for ETL Process

### Description

A Bash script was created to perform a simple ETL process:

- **Extract**: Download a CSV file and save it to a `raw` folder.
- **Transform**: Rename a column and select specific columns, saving the result to a `Transformed` folder.
- **Load**: Copy the transformed file to a `Gold` folder for final storage.

### Script Details

The script:
- Utilizes environment variables for the URL to download the CSV.
- Verifies that files are correctly stored at each stage.

### Cron Job

The script is scheduled to run daily at 12:00 AM using a cron job. This was accomplished using a Bash script that automatically adds the job to the system's `crontab`.

## Task 2: SQL Queries

Four SQL queries were written to answer specific business questions. These queries were executed on the PostgreSQL database named `posey`.


### Query 1: Order IDs where gloss_qty or poster_qty > 4000

```sql
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;
```


### Query 2: Orders with standard_qty = 0 and gloss_qty or poster_qty > 1000

```sql
SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);
```


### Query 3: Company names starting with 'C' or 'W', primary contact contains 'ana' but not 'eana'

```sql
SELECT name
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
AND ((primary_poc ILIKE '%ana%' OR primary_poc ILIKE '%Ana%') AND primary_poc NOT ILIKE '%eana%');
```


### Query 4: Region, Sales Rep, and Account Names

```sql
SELECT r.name region_name, a.name account_name, s.name sales_rep
FROM sales_reps s
JOIN accounts a ON s.id = a.sales_rep_id
JOIN region r ON s.region_id = r.id
ORDER BY account_name ASC;
```


## Cron Job Setup

A Bash script was written to schedule the ETL script to run daily at midnight. The cron job was set up by appending the appropriate command to the user's crontab.

## Architecture Diagram

An architectural diagram was created to visualize the ETL process. The diagram outlines the flow from data extraction to loading into the PostgreSQL database.

![ETL Architecture Diagram](path_to_diagram.png)

## How to Run the Scripts

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/johnafariogun/cde_linux_git_assignment-
   ```
2. **Navigate to the Scripts Directory**:
   ```bash
   cd Scripts
   ```

4. **Verify the Cron Job**:
   ```bash
   crontab -l
   ```

5. **Execute SQL Queries**:
   Use PostgreSQL's command line or pgAdmin to execute the SQL scripts stored in the `SQL_Scripts` folder.

6. **Push Changes to GitHub**:
   - Create a new branch for your changes.
   - Commit your changes and push them to your GitHub repository.
   - Submit a pull request to merge your branch into the `master` branch.

```


