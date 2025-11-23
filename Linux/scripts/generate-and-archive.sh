#!/usr/bin/env bash
# generate-and-archive.sh
set -euo pipefail

OUTDIR="/tmp/test-data/$(date +%F)"
mkdir -p "$OUTDIR"

log() { echo "[$(date +'%H:%M:%S')] $*"; }

log "Generating 1000 test files → $OUTDIR"
for i in $(seq -w 001 1000); do
  size=$(( RANDOM % 10 + 1 ))      # 1–10 MB
  dd if=/dev/urandom of="$OUTDIR/file_$i.dat" bs=1M count="$size" status=none
done

log "Creating compressed archive"
tar -czf "/backup/test-data-$(date +%F).tar.gz" "$OUTDIR"

log "Done! $(du -h /backup/test-data-$(date +%F).tar.gz | cut -f1)"