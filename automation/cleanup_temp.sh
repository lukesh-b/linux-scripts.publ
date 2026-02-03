#!/bin/bash
# Cleanup /tmp and old log files

echo "Cleaning /tmp directory..."
sudo rm -rf /tmp/*

echo "Removing old logs from /var/log..."
sudo find /var/log -type f -name "*.log" -mtime +7 -exec rm -f {} \;

echo "Cleanup complete!"
