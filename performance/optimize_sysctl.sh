#!/bin/bash

# Basic Linux Performance Tuning

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

echo "Applying performance optimizations..."

sysctl -w net.core.somaxconn=1024
sysctl -w net.ipv4.tcp_tw_reuse=1
sysctl -w vm.swappiness=10

echo "Done."

