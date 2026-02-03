#!/bin/bash
# Simple home directory backup

BACKUP_DIR=~/backup_home_$(date +%Y%m%d)
mkdir -p "$BACKUP_DIR"
rsync -avh ~/ "$BACKUP_DIR"
echo "Backup completed at $BACKUP_DIR"
