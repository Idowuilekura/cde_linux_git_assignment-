
## 🌟 Getting down to the solutions proper 

### Creating the necessary directories

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

The well detailed script for the etl process can be found in the [etl_script.sh](/root/CoreDataEngineers/LinuxGitAssignment/Scripts/Bash/etl_script.sh) file.
