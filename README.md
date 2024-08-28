# cde_linux_git_assignment-

You have been hired as the new Data engineer at CoreDataEngineers, CoreDataEngineer infrastructure is based on the Linux Operating System.  Your manager has tasked you with the responsibilty of managing the company data infrasctruture and Version Control tool.

1. Your manager has tasked you with the responsibility of building a Bash script that performs a simple ETL processing which
- Downloads (Extract) a CSV file, you can access the CSV with this [Link](https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv). Download it, into a folder called `raw`, your script should assert that the file was saved into the `raw` folder. 
- After downloading the file, you are to perform simple transformation, rename the column called Variable_code to variable_code. Select only these columns `year, Value, Units, variable_code` from the csv file. Once, you are done save the content of the selected columns into a file with the name `2023_year_finance.csv`. The file should be saved in a folder with the name Transformed
- Load the transformed data into a directory with name Gold. also assert that the file was saved into the folder.
  N.B use environment variables for the URL name, and call it in your script. Write a well-detailed script, add enough comment to the script and print out information for each step.
  
2. You manager has asked you to schedule the script to run daily, using cron jobs (make research about this), scehdule the script to run everyday by 12:AM. 

3. Write a bash script to move all CSV and Json files from a folder to another folder named `json_and_CSV`.

4. CoreDataEngineers is trying to diversify into the sales of goods and services, to understand the market, your organization need to understand their competitor which is `Parch and Posey`. Download the csv file with this [Link](https://we.tl/t-2xYLL816Yt) to your local PC, after which you do the following.
5. 
   -  Write a bash script that copy each of the CSV file into Postgres Database (name the database posey), do the copy with an iteration.
   -  After which, you will need to write SQL scripts with detailed comments that answers these question posed by your manager (Ayoola)
       - /* Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table */
      - /* Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000 */
      - /* Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana' */
      -  /* Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name */


Document, the solution to the questions, using a well-detailed github README file, upload all scripts into a folder named (`Scripts`), inside the scripts folder, have a folder to store the bash scripts and another for SQL scripts. Push all works to Github (do not push the CSV files), ensure you do not push directly to master but merge to master with a pull request (you should know what to do). Ensure, to add an Architectural Diagram of the ETL pipeline, that your manager has asked you to do. 


