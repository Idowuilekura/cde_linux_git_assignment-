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
 