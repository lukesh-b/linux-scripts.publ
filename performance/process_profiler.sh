#!/bin/bash

# Process CPU and Memory Profiler

echo "Top 10 CPU-consuming processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 11

echo ""
echo "Top 10 Memory-consuming processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 11

