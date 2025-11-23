#!/usr/bin/env bash
# disk-alert.sh
set -euo pipefail

THRESHOLD=85

df -P | tail -n +2 | while read -r fs size used avail pcent mount; do
  used_pct=${pcent%%%}
  if (( used_pct > THRESHOLD )); then
    echo "CRITICAL: $mount is $used_pct% full!"
  fi
done