#!/bin/bash
# Incremental backup using rsync

SRC="$HOME/"
DEST=~/backup_incremental
mkdir -p "$DEST"
rsync -avh --link-dest="$DEST/last" "$SRC" "$DEST/$(date +%Y%m%d)"
rm -rf "$DEST/last"
ln -s "$(date +%Y%m%d)" "$DEST/last"
echo "Incremental backup done at $(date)"
