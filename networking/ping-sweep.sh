#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 192.168.1"
    exit 1
fi

for ip in {1..254}
do
    ping -c 1 -W 1 "$1.$ip" &> /dev/null
    if [ $? -eq 0 ]; then
        echo "Host $1.$ip is UP"
    fi
done

