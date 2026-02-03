#!/bin/bash
# Monitor disk usage

THRESHOLD=80

df -H | grep -vE '^Filesystem|tmpfs|cdrom' | while read output; do
  usage=$(echo $output | awk '{print $5}' | sed 's/%//g')
  partition=$(echo $output | awk '{print $1}')
  if [ $usage -ge $THRESHOLD ]; then
    echo "Warning: Partition $partition usage is at ${usage}%"
  fi
done
