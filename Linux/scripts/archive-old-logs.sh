#!/usr/bin/env bash
# archive-old-logs.sh
set -euo pipefail

SOURCE_DIR="/var/log/myapp"      # change to your test dir
ARCHIVE_BASE="/backup/logs-archive"
DAYS=5

mkdir -p "$ARCHIVE_BASE"

find "$SOURCE_DIR" -type f -name "*.log" -mtime +"$DAYS" | while read -r file; do
  file_date=$(date -r "$file" +%Y-%m-%d)
  target_dir="$ARCHIVE_BASE/$file_date"
  mkdir -p "$target_dir"
  mv -v "$file" "$target_dir/"
  gzip "$target_dir/$(basename "$file")"
done