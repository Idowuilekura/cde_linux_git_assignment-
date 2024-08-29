
# Individual Assignment
You have been hired as a new Data Engineer at CoreDataEngineers. The CoreDataEngineers infrastructure is based on the Linux Operating System. Your manager has tasked you with the responsibility of managing the company’s data infrastructure and version control tool.

1. Your manager has assigned you the task of building a **Bash** script (use only bash scripting) that performs a simple ETL process:

   - **Extract:** Download a CSV file. You can access the CSV using this [link](https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv). Save it into a folder called `raw`. Your script should confirm that the file has been saved into the `raw` folder.
   
   - **Transform:** After downloading the file, perform a simple transformation by renaming the column named `Variable_code` to `variable_code`. Then, select only the following columns: `year, Value, Units, variable_code`. Save the content of these selected columns into a file named `2023_year_finance.csv`. This file should be saved in a folder called `Transformed`, your Bash script should confirm that it was loaded into the folder.
   
   - **Load:** Load the transformed data into a directory named `Gold`. Also, confirm that the file has been saved into the folder.

   Note: Use environment variables for the URL, and call it in your script. Write a well-detailed script, add sufficient comments to the script, and print out information for each step.

2. Your manager has asked you to schedule the script to run daily using cron jobs (research this). Schedule the script to run every day at 12:00 AM.

3. Write a Bash script to move all CSV and JSON files from one folder to another folder named `json_and_CSV`. Use any Json and CSV of your choice, the script should be able to work with one or more Json and CSV files. 

4. CoreDataEngineers is diversifying into the sales of goods and services. To understand the market, your organization needs to analyze their competitor, `Parch and Posey`. Download the CSV file using this [link](https://we.tl/t-2xYLL816Yt) to your local PC. After downloading, do the following:

   - Write a Bash script that iterates over and copies each of the CSV files into a PostgreSQL database (name the database `posey`).
   
   - After this, write SQL scripts with detailed comments to answer the following questions posed by your manager (Ayoola):
   
     - /* Find a list of order IDs where either `gloss_qty` or `poster_qty` is greater than 4000. Only include the `id` field in the resulting table. */
     
     - /* Write a query that returns a list of orders where the `standard_qty` is zero and either the `gloss_qty` or `poster_qty` is over 1000. */
     
     - /* Find all the company names that start with a 'C' or 'W', and where the primary contact contains 'ana' or 'Ana', but does not contain 'eana'. */
     
     - /* Provide a table that shows the region for each sales rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) by account name. */

Document the solutions to these questions using a well-detailed GitHub README file. Upload all scripts into a folder named `Scripts`. Inside the `Scripts` folder, create separate folders to store the Bash scripts and SQL scripts. Push all work to GitHub (do not push the CSV files). Ensure that you do not push directly to the master branch but instead merge to master via a pull request (you should know what to do). Additionally, create an architectural diagram of the ETL pipeline as requested by your manager.


## Group Assignment 
For this, you need to work in groups of three (you will be shared into groups). Design a Powerpoint with any insight that you got from the Posey database tables, do an exploratory analysis on the tables and come up with a Presentation for your manager. Give your group a name and choose a single person github account to document your insights (as images and text) and also to upload your powerpoint files (all members are to contribute to the repository, through pull requests i.e each member should have different branches) 

Kindly drop your name, email(used to register for the Bootcamp) and github account username on this [link](https://docs.google.com/forms/d/1HvIx83UFEkVX1Uqnddk3_Tg0IkpvvGk4DJaQY8YjUgA/edit)

**N.B** Both Personal and Group Assignment are due in 1 week (the 5th of September 2024)
Submit the assignment(for the email section, use the Email used to register for the Bootcamp) with this [Assignment Submission Link](https://docs.google.com/forms/d/15Gm-56XhsAvzed0cRV-gBFEG8xaTl3egmG-iPJWz5X0/edit). I wish you all Goodluck.



