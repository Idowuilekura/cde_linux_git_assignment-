## Assignment Report
There are two folders containing the bash scripts and the SQL scripts.

### Bash Scripting
1. **Extract-Transform-Load Pipeline**
This pipeline does the following:
 a) checks and creates all folders required for the pipeline.
 b) downloads data from online, and store locally.
 c) transforms the data and load the transform data into the Gold folder.

 **Architectural Diagram**
 [![name](link to image on GH)]

2. **Move Files Across Folders**
This pipeline moves all JSON and CSV files from a source folder to a destination folder.
 **Architectural Diagram**
 [![name](link to image on GH)]

3. **Extract-Load to Postgres**
This pipeline extract data from github repo and ingest to Postgres database for further analysis
 **Architectural Diagram**
 [![name](link to image on GH)] 

### SQL Analysis
1. **Number of Orders where gloss_qty and poster_qty is above 4000**
[![name](link to image on GH)]
2. **Number of orders where gloss_qty and poster_qty is above 1000 and standard_qty is above 0**
[![name](link to image on GH)]
3. **company names**
[![name](link to image on GH)]
4. **the region for each sales rep along with their associated accounts**
[![name](link to image on GH)]

