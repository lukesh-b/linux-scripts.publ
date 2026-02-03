#!/bin/bash
# Update system packages automatically

echo "Updating package lists..."
sudo apt update -y

echo "Upgrading packages..."
sudo apt upgrade -y

echo "Autoremove unnecessary packages..."
sudo apt autoremove -y

echo "System update completed!"
