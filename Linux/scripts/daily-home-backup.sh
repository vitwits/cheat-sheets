#!/usr/bin/env bash
# daily-home-backup.sh
set -euo pipefail

BACKUP_DIR="/backup/home"
DATE=$(date +%F)
KEEP=7

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/home-$DATE.tar.gz" \
  --exclude="$HOME/.cache" \
  --exclude="*.tmp" \
  "$HOME"

# delete old backups
find "$BACKUP_DIR" -name "home-*.tar.gz" -mtime +"$KEEP" -delete

echo "Backup done → $BACKUP_DIR/home-$DATE.tar.gz"