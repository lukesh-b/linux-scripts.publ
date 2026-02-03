#!/bin/bash
# Combined system health check

echo "Checking disk usage..."
bash monitoring/disk_usage.sh

echo "Checking CPU and memory..."
bash monitoring/cpu_memory.sh

echo "System health check complete!"
