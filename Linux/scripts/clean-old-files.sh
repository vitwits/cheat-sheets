#!/usr/bin/env bash
# clean-old-files.sh
set -euo pipefail

DAYS=${1:-30}
DRY_RUN=${DRY_RUN:-false}
TARGET_DIRS=("/var/log" "/tmp" "$HOME/downloads" "$HOME/.cache")

log() { echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*"; }

log "Looking for files older than $DAYS days"
for dir in "${TARGET_DIRS[@]}"; do
  [ -d "$dir" ] || continue
  log "Scanning $dir"
  find "$dir" -type f \( -name "*.log" -o -name "*.tmp" -o -name "*~" \) -mtime +"$DAYS" -print | while read -r file; do
    if $DRY_RUN; then
      echo "[DRY-RUN] Would delete: $file"
    else
      rm -fv "$file"
    fi
  done
done


# DRY_RUN=true ./clean-old-files.sh 7    # see what would be deleted
# ./clean-old-files.sh 7                 # actually delete