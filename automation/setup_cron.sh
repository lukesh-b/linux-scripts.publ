#!/bin/bash
# Helper to add cron jobs

echo "Enter the cron job you want to add (e.g., '* * * * * /path/to/script.sh'):"
read CRON_JOB

(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "Cron job added successfully!"
