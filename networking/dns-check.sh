#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 domain.com"
    exit 1
fi

echo "Checking DNS for $1..."
echo ""

dig "$1" +short

