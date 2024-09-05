# CDE_Linux_Git_Assignment

Description:

This repository contains solutions for the Linux and Git assignment from the Core Data Engineers Bootcamp, a highly intensive program designed to enhance data engineering skills. The assignment focuses on leveraging Linux environments and Git to perform ETL (Extract, Transform, Load) processes, demonstrating proficiency in handling data with command-line tools and version control.

The Assignment is divided into two parts:

- Personal Assignment 
- Group Assignment

Below is the detailed direction for the Personal and Group assignments. After the description, follows my detailed solutions on how I tackled each step of the assignment questions. 

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



# Solutions: Personal Assignment

## 🌟Get your Linux Environment Ready
It'd be nice to remember that all solution to the personal assignment uses bash scripting, and this means you would be working in a linux environment in order to use bash scripting.

#### Option 1: Use GitBash
So, first things first would be to download [GitBash](https://www.youtube.com/watch?v=USZqL4QDXjU) (this gives you a pseudo-linux terminal) and Git terminal.

#### Option 2: Use Windows Subsystem for Linux

Or if you are more experienced, you can use **Windows Subsystem for Linux.** Kindly use this [link](https://learn.microsoft.com/en-us/windows/wsl/install) to install and setup WSL on windows if you like reading articles or this [link](https://www.youtube.com/watch?v=cJWhyycbPyA) if you prefer watching videos. 

#### Option 3: (If you are more experienced)
You can use a **virtual machine** (which installs a Linux OS on your windows system). Watch a video on how to install a Linux VM with this [link](https://www.youtube.com/watch?v=DhVjgI57Ino).

#### Option for MacOS Users 
Use this [link](https://www.youtube.com/watch?v=Mf3l8z6oxQ0) to install Git on your system, you do not need to install a linux terminal (MacOS comes with a linux terminal by default)


**N.B:** Linux users do not need to install Git or any terminal. 


## 🌟 Getting down to the solutions proper 

### Setting up the Environment

1. Confirm you are in the home directory in the WSL by running:

`cd ~`

2. Create a folder in the home directory that will host all Bootcamp Assignments

`mkdir CoreDataEngineers`

3. Enter the Bootcamp Folder

`cd CoreDataEngineers`

4. Create a folder that will host the Linux Git Assignment

`makdir LinuxGitAssignment`

5. Enter the Assignment Folder

`cd LinuxGitAssignment`

6. Having recognized all the folders needed for the assignment, create them before the ETL process, go ahead and create the folders inside the LinuxGitAssignment folder

    Create the folders at the same time

`mkdir -p raw Transformed Gold Scripts/Bash Scripts/SQL json_and_CSV`

7. Navigate to the Scripts/Bash Folder

`cd Scripts/Bash`

### Answering the questions

### Question 1

***Creating scripts for the ETL Process***

Create a Bash script file called **etl_script.sh** in the Bash directory.

`touch etl_script.sh`

Add the execute permission to the script file

`chmod +x etl_script.sh`

Open and Edit the Script file

`nano etl_script.sh`

The well -etailedscript for the etl process can be found in the [etl_script.sh](/root/CoreDataEngineers/LinuxGitAssignment/Scripts/Bash/etl_script.sh) file.


### Question 2:
Schedule the script to run every day at 12:00 AM  using cron jobs.

Before answering this question, I created a **logs** folder under the LinuxGitAssignmnet folder that will host a text file called **etl_log.txt**. The txt file will hold all errors and the output of the cron job after it has ben run at the specified time.

  * Start the Cron Service: First, ensure that the cron service is installed and running. If it's not running, the scheduled jobs will not execute. You can start it by running: `sudo service cron start`

  * If the cron service is not installed, you can install it using:

    `sudo apt update`
    
    `sudo apt install cron`

  * To edit the cron jobs for the current user (mine is the root user), use the following command to open the crontab editor: `crontab -e`

  * The first time you run crontab -e, it might prompt you to choose an editor (e.g., nano, vi, or vim). If it does, select your preferred editor by typing the corresponding number and pressing Enter.

  * Add the cron job line: Scroll to the bottom of the crontab file (if it’s not empty) and add your cron job line:

    `0 0 * * * /bin/bash /root/CoreDataEngineers/LinuxGitAssignment/Scripts/Bash/etl_script.sh >> /root/CoreDataEngineers/LinuxGitAssignment/logs/etl_log.txt 2>&1`

     * `0 0 * * *` schedules the script to run daily at 12:00 AM.

    * `/bin/bash` specifies the shell to use for running the script.

    * `/root/CoreDataEngineers/LinuxGitAssignment/Scripts/Bash/etl_script.sh` is the path to the script you want to execute.

    * `>> /root/CoreDataEngineers/LinuxGitAssignment/logs/etl_log.txt` redirects the output of the script to a log file.

    * `2>&1` ensures that both standard output and error messages are logged.

* Save and exit the editor:

    In nano, press `Ctrl + O` to save and `Ctrl + X` to exit.

    In vi or vim, press `Esc`, type `:wq`, and press `Enter` to save and exit.

* Verify the cron job: To verify that your cron job has been scheduled correctly, you can list all cron jobs with: `crontab -l`

* verify that the cron service is running with the following command: `sudo service cron status`


### Question 3:
**PS:** 

* I chose to work with the CSV files in the **raw** folder

* I also created a sample JSON file in the raw folder that will be used to simulate this task. Use `touch temp_file.json` to create a sample json file.

* Create a bash script file that will hold the script to move all CSV and JSON files to a folder called **json_and_CSV**.

    `touch  move_files.sh`

* Run `chmod +x move_files.sh` to make the script executable.

* Use nano to open the `move_files.sh` file and write the script for the task. Press `Ctrl + O` to save and `Ctrl + X` to exit. 

* The well-detailed **script** that was used to move the csv and json files in the raw folder to the json_and_CSV folder can be found [here](/root/CoreDataEngineers/LinuxGitAssignment/Scripts/Bash/move_files.sh).

* Now, execute the script by running `./move_files.sh`.


### Question 4:
#### Downloading the CSV files

* Download the CSV files to your local pc using the [link](https://we.tl/t-2xYLL816Yt)

*  Navigate to the LinuxGitAssignment Folder and create a folder named `csv_files`. This folder will hold all the CSV files after you move them from your local pc to the WSL environment.

    `mkdir -p ~/CoreDataEngineers/LinuxGitAssignment/csv_files`

*  Copy the CSV Files from the **Downloads folder** in the Windows OS to Your WSL Environment

    -  Navigate to Your Windows Downloads Folder: 

        `cd /mnt/c/Users/YourUsername/Downloads`. (Replace YourUsername with your actual Windows username.)

    - Copy Files to the Desired WSL Folder: 

        `cp *.csv ~/CoreDataEngineers/LinuxGitAssignment/csv_files/`

#### Setting up your postgresql database

So, before you now move the CSV files from the csv_files folder which is a folder to postgreSQL database called **posey**, you need to install a postreSQL engine inside the Linux environment. 😅 

Well, I diddn't know this earlier as I was confused and thought the PostgreSQL engine installed in the Windows OS would be same engine for the Linux environment.

So, I was expecting that when I create a database via the pg4admin interface of which is also accessed via the Windows OS, then I will be able to work with that database via the Linux terminal. 

This is not possible except it is absolutely specified in your script that you want to access your Windows PostgreSQL from Linux environment.

So, I believe this task wants us to:

* Download the PostgreSQL engine in our Linux environment (the PostgreSQL server and its data directory are configured within this environment)

* Create the database called **posey**, 

* Move the CSV files to that database, 

* And then run SQL queries to answer the qyestions asked.


---

**BEFORE ATTEMPTING moving CSV files to PostgreSQL database called posey. In fact before you create your posey databse**:

1. **Check PostgreSQL Installation:**

    Ensure that PostgreSQL is installed properly on your Linux system. You can verify this by running: 

    `psql --version`

2. **Install PostgreSQL Server:**

    If the server package is not installed, you can install it using:

    `sudo apt update`

    `sudo apt install postgresql postgresql-contrib`

3. **Start and Enable PostgreSQL Service Manually in WSL:**

    Normally, in a standard Linux environment, you would use **systemctl** to manage services, but WSL does not fully support **systemd** by default. Instead, you can start the PostgreSQL server manually using:

    `sudo service postgresql start`

4. **Configure PostgreSQL for WSL:**

    If the above steps still do not start the server, configure PostgreSQL by initializing the data directory manually. Run:

    `sudo pg_ctlcluster 14 main start`

    *This assumes you have PostgreSQL 14 installed; adjust the version if necessary.*

5. **Check if PostgreSQL is Running:**

    `pg_isready`

    *This command should respond with* **accepting connections.**

6. **Set PostgreSQL to Start on Boot in WSL or in your Linux environment( I skipped this part. It is optional):**

    To make PostgreSQL start automatically when you start your WSL instance, you can add the start command to your shell configuration file (e.g., ~/.bashrc):

    `echo "sudo service postgresql start" >> ~/.bashrc`

7.  **Setting the password for the postgres User**

    * Enable the postgres command line interface:

         `sudo -u postgres psql`

    * Once inside the PostgreSQL CLI, reset the password for the postgres user:

        `\password postgres`

    * Enter a new password when prompted. This will set the password for the postgres user.

8. **Create the Database named** *posey*.

    `CREATE DATABASE posey;`
    
9. **Verify the Database has been created**

    `psql -l`
   
    *This command will list all databases, and you should see posey in the list.*

10. **Run your script**

    This is where you exit the postgresSQL CLI to create a **script** that will move the CSV files to the database.

    * Exit the postgre SQL CLI with: `\q`

    * Navigate to the Bash folder:
    
        `cd ~/CoreDataEngineers/LinuxGitAssignment/Scripts/Bash`

    * Create a bash script file that will hold the script tthat will iterate over the CSV files in the **csv_files** folder and copy them to the **posey** database.

        `touch load_csv_to_postgres.sh`

    * Make the file executable

         `chmod +x load_csv_to_postgres.sh`

    * Open the file to write the detailed script for the task

        `nano load_csv_to_postgres.sh`

    * Write a bash script that iterates over and copies each of the CSV files into a PostgreSQL database. The bash script can be found in the **[load_csv_to_postgres.sh](/root/CoreDataEngineers/LinuxGitAssignment/Scripts/Bash/load_csv_to_postgres.sh)** file.

    * After writing the bash script, press **Ctrl O** to save the file and **Ctrl X** to exit the file.

    * Run the script using: `./load_csv_to_postgres.sh`

11. After running the script and the CSV files are moved from their location in the csv_files folder to the posey database.

    * Access PostgreSQL Command Line again: 
    
        `psql -U postgres -d posey -h localhost -p 5432`

    * List all tables in the database:

        `\dt`

    * Check table contents of a specific table:

        `SELECT * FROM accounts LIMIT 10;`

    * Describe table structure (columns, data types, etc.) of a specific table:

         `\d accounts`
 
 #### SQL scripts to answer the following questions posed by the manager (Ayoola):

- /* Find a list of order IDs where either `gloss_qty` or `poster_qty` is greater than 4000. Only include the `id` field in the resulting table. */

**Result:**
```sql
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;
```
id | 
--| 
362 | 
731 | 
1191 | 
1913 |
1939 | 
3778 | 
3858 | 
3963 | 
4016 | 
4230 |
4698 | 
4942 | 
5791 | 
6590 | 

*14 Order ids had either **gloss_qty** or **poster_qty** greater than 4000.*


- /* Write a query that returns a list of orders where the `standard_qty` is zero and either the `gloss_qty` or `poster_qty` is over 1000. */

**Result:**

```sql
SELECT *
FROM orders
WHERE standard_qty = 0 
  AND (gloss_qty > 1000 OR poster_qty > 1000);
```

| id | account_id | occurred_at | standard_qty | gloss_qty | poster_qty | total | standard_amt_usd | gloss_amt_usd | poster_amt_usd | total_amt_usd |
|----|------------|-------------|--------------|-----------|------------|-------|------------------|---------------|----------------|---------------|
|    |            |             |              |           |            |       |                  |               |                |               |

*No orders had a **standard_qty** of zero and either a **gloss_qty** or **poster_qty** greater than 1000.*


- /* Find all the company names that start with a '**C**' or '**W**', and where the primary contact contains '**ana**' or '**Ana**', but does not contain '**eana**'. */

**Result:**

```sql
SELECT name
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
  AND (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%')
  AND primary_poc NOT LIKE '%eana%';
```

name | 
--| 
CSV Health | 
Comcast | 
     
*Only two accounts had their names starting with a **C** or **W** and had their primary contacts containg '**ana**' or '**Ana**', but not '**eana**'.*


- /* Provide a table that shows the region for each sales rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) by account name. */

**Result:**

```sql
SELECT 
    r.name AS region_name,
    sr.name AS sales_rep_name,
    a.name AS account_name
FROM sales_reps sr
JOIN region r ON sr.region_id = r.id
JOIN accounts a ON sr.id = a.sales_rep_id
ORDER BY account_name;
```
| region_name | sales_rep_name       | account_name              |
|-------------|-----------------------|---------------------------|
| Northeast   | Sibyl Lauria          | 3M                        |
| Southeast   | Earlie Schleusner     | ADP                       |
| Southeast   | Moon Torian           | AECOM                     |
| Southeast   | Calvin Ollison        | AES                       |
| Northeast   | Elba Felder           | AIG                       |
| Northeast   | Necole Victory        | AT&T                      |
| Midwest     | Julie Starr           | AbbVie                    |
| Midwest     | Chau Rowles           | Abbott Laboratories       |
| West        | Marquetta Laycock     | Advance Auto Parts        |
| Northeast   | Renetta Carew         | Aetna                     |

*The result shows the first few rows of the **351 rows** showing the region for each sales rep along with their associated accounts.*


This brings us to the end of the solutions for the personal; assignment.

# Solutions: Group Assignment

The group assignment solution has been documented in this seperate repository all the group members including me contributed to.

