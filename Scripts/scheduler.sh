#!/bin/bash

echo "==== Schedule a cron job to run everyday at 12:00am ===="

# To access permissions for execution
chmod +x etl-process.sh

# The full path to the etl-process.sh script
ETL_PROCESS_SCRIPT="/etl-process.sh"

# Check if the cron job already exists at 12:00am everyday
CRON_JOB="0 0 * * * $ETL_PROCESS_SCRIPT"


# Add the cron job if it's not already there
(crontab -l | grep -v "$ETL_PROCESS_SCRIPT"; echo "$CRON_JOB") | crontab -

echo "==== Completed cron job ===="
