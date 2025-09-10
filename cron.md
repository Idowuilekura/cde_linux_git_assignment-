# Scheduled Tasks

This project includes a cron job that runs daily at 12:00 AM.

## Cron Job Configuration
```bash
0 0 * * * /bin/bash /path/to/assignment.sh >> /path/to/etl_log.txt 2>&1

##Setup Instructions
##Make the script executable: chmod +x assignment.sh
##Add to crontab: crontab -e
##Add the above cron job line
##Start cron service: sudo /usr/sbin/cron