0 0 * * * /bin/bash /root/CoreDataEngineers/LinuxGitAssignment/Scripts/Bash/etl_script.sh >> /root/CoreDataEngineers/LinuxGitAssignment/logs/etl_log.txt 2>&1

# This cron job runs a bash script called etl_script.sh every day at midnight. Here’s a breakdown

# 0 0 * * *: This timing pattern means the job runs at 00:00 every day.

# /bin/bash /root/CoreDataEngineers/LinuxGitAssignment/Scripts/Bash/etl_script.sh: This command specifies the script to be executed, located at the specified path.

# >> /root/CoreDataEngineers/LinuxGitAssignment/logs/etl_log.txt: This part appends the script’s output to the log file etl_log.txt.

#2>&1: This redirects any errors (standard error) to the same log file.