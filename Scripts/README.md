## Assignment Report
There are two folders containing the bash scripts and the SQL scripts.

### Bash Scripting

1. **Extract-Transform-Load Pipeline**

This pipeline does the following:

 a) checks and creates all folders required for the pipeline.

 b) downloads data from online, and store locally.

 c) transforms the data and load the transform data into the Gold folder.

 **Architectural Diagram**

 [![ETL Pipeline](https://github.com/JosephItopa/cde_linux_git_assignment-/blob/assignment/images/etl_ingestion_pipeline.PNG)]

2. **Move Files Across Folders**

This pipeline moves all JSON and CSV files from a source folder to a destination folder.

 **Architectural Diagram**

 [![Moving Files](https://github.com/JosephItopa/cde_linux_git_assignment-/blob/assignment/images/move_from_folder_a2b.PNG)]

3. **Extract-Load to Postgres**

This pipeline extract data from github repo and ingest to Postgres database for further analysis

 **Architectural Diagram**

 [![Extract-Load](https://github.com/JosephItopa/cde_linux_git_assignment-/blob/assignment/images/ingestion_local_db.PNG)]

### SQL Analysis

1. **Number of orders where gloss_qty and poster_qty is above 4000**

[![Number of orders](https://github.com/JosephItopa/cde_linux_git_assignment-/blob/assignment/images/%5B1%5D.PNG)]

2. **Number of orders where gloss_qty and poster_qty is above 1000 and standard_qty is above 0**

[![Number of orders](https://github.com/JosephItopa/cde_linux_git_assignment-/blob/assignment/images/%5B2%5D.PNG)]

3. **company names**

[![company names](https://github.com/JosephItopa/cde_linux_git_assignment-/blob/assignment/images/%5B3%5D.PNG)]

4. **the region for each sales rep along with their associated accounts**

[![associated accounts by region](https://github.com/JosephItopa/cde_linux_git_assignment-/blob/assignment/images/%5B4%5D.PNG)]

[![name](link to image on GH)]

