#!/bin/bash

# Disk I/O Monitor

echo "Disk I/O Statistics (Requires iostat)"
echo "-------------------------------------"

if ! command -v iostat &> /dev/null; then
    echo "iostat not found. Install sysstat package."
    exit 1
fi

iostat -xz 2

