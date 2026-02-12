#!/bin/bash

# CPU Usage Monitor

echo "CPU Usage Monitor (Press Ctrl+C to stop)"
echo "----------------------------------------"

while true; do
    top -bn1 | grep "Cpu(s)" | \
    awk '{print "CPU Usage: " 100 - $8 "%"}'
    sleep 2
done

