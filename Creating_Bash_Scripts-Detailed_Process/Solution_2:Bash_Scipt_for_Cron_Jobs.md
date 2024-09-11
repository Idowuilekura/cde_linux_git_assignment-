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