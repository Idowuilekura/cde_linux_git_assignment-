# cde_linux_git_assignment-
The repository for Linux and Git Assignment 
You have been hired as the new Linux engineer at CoreDataEngineers, your manager has tasked you with the responsibilty of managing the company data infrasctruture and Version Control tool.

1. Your manager has tasked you with the responsibility of building a Bash script that performs a simple ETL processing which
- Downloads (Extract) a CSV file, you can access the CSV with this [Link](https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv). Download it, into a folder called `raw`
- After downloading the file, you are to perform simple transformation, rename the column called Variable_code to variable_code. Select only these columns `year, Value, Units, variable_code` from the csv file. Once, you are done save the content of the selected columns into a file with the name `2023_year_finance.csv`. The file should be saved in a folder with the name Transformed
- Load the transformed data into a directory with name Gold.
  N.B use environment variables for the URL name, and call it in your script. Write a well-detailed script, add enough comment to the script and print out information for each step.
  
2. You manager has asked you to schedule the script to run daily, using cron jobs (make research about this), scehdule the script.

3. Write a script to move all CSV and Json files from a folder to another folder named `json_and_CSV`. 

Document, the solution to the three questions, using a well-detailed github README file, upload all scripts into a folder named (Scripts). Push all works to Github (do not push the CSV file), ensure you do not push directly to master but merge to master with a pull request (you should know what to do). Ensure, to add an Architectural Diagram of the ETL pipeline, that your manager has asked you to do. 


