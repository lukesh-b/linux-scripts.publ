#!/bin/bash
# Monitor CPU and memory usage

echo "CPU Usage:"
top -bn1 | grep "Cpu(s)"

echo "Memory Usage:"
free -h
