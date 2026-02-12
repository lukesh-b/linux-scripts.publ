#!/bin/bash

# Memory Analyzer

echo "Memory Usage Report"
echo "-------------------"

free -h

echo ""
echo "Top 5 Memory Consuming Processes:"
ps aux --sort=-%mem | head -n 6

