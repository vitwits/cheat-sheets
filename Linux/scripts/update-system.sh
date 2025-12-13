#!/bin/bash

# ==========================================================
# Script for updating and upgrading Debian based distros
# Author: Vitaly Dubyna
# Date: 2024-05-24
#===========================================================

# Config
LOG_DIR="/var/log/update_script"
LOG_FILE="$LOG_DIR/update_$(date +'%Y-%m-%d_%H-%M-%S').log"
EMAIL="example@mail.com" # Replace with your actual email

# --- Helper Functions ---
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" | tee -a "$LOG_FILE"
}

log_error() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: $*" | tee -a "$LOG_FILE" >&2
}

# --- Root privileges check ---
if [[ $EUID -ne 0 ]]; then
  echo "You need to be root to run the script."
  echo "Please run: sudo $0"
  exit 1
fi

# --- Create log folder if it does not exist ---
mkdir -p "$LOG_DIR" || { log_error "Failed to create log directory: $LOG_DIR"; exit 1; }

echo "=== Update started $(date) ===" | tee -a "$LOG_FILE"

# --- Set DEBIAN_FRONTEND to noninteractive ---
# This prevents apt from asking interactive questions during upgrades
export DEBIAN_FRONTEND=noninteractive

# --- Package list update ---
log_message "Updating package lists..."
if ! apt-get update -y 2>&1 | tee -a "$LOG_FILE"; then
    log_error "Failed to update package lists."
    exit 1
fi

# --- Package upgrade ---
# -o Dpkg::Options::="--force-confdef" and --force-confold
# These options tell dpkg what to do with configuration files that have changed.
# --force-confdef: use the default action (usually install new config if no local changes, or keep old if locally modified).
# --force-confold: always keep your currently installed configuration files.
# Choose one based on your policy for config files. force-confold is safer for stability.
# For full automation, --assume-yes (-y) is used, but apt may still prompt for some very critical changes.
log_message "Upgrading packages..."
if ! apt-get upgrade -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  2>&1 | tee -a "$LOG_FILE"; then
    log_error "Failed to upgrade packages."
  exit 1
fi

# --- Clean up old packages ---
log_message "Cleaning up old packages..."
if ! apt-get autoremove -y 2>&1 | tee -a "$LOG_FILE"; then
    log_error "Failed to autoremove packages."
fi

log_message "Cleaning package cache..."
if ! apt-get clean 2>&1 | tee -a "$LOG_FILE"; then
    log_error "Failed to clean package cache."
fi


echo "Update finished $(date)" | tee -a "$LOG_FILE"

# --- Sending report to email (need to set a mail client) ---
if command -v mail &> /dev/null; then
  log_message "Sending email report to $EMAIL..."
  if ! mail -s "Package update on $(hostname) finished" "$EMAIL" < "$LOG_FILE"; then
      log_error "Failed to send email report."
  fi
else
  log_message "Mail command not found. Logs saved to $LOG_FILE."
fi
