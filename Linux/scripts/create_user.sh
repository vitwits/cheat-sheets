#!/bin/bash

# ==============================================================================
# Script to create users, add them to groups, set passwords, and configure permissions
#
# Usage:
#   sudo ./create_user.sh
#
# Author: Vitaly Dubyna
# Date: 2024-05-24
# ==============================================================================


# --- Configure Script ---
LOG_FILE="/var/log/script_logs.log"
MIN_PASS_LENGTH=16
SUDO_GROUP="sudo"  # or use "wheel" group on RHEL based distros
DEFAULT_SHELL="/bin/bash"
PASSWORD_EXPIRATION_DAYS=90
MIN_DAYS_BEFORE_CHANGE=1

# --- Logging Functions ---
log_action() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" | tee -a "$LOG_FILE"
}

log_error() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" | tee -a "$LOG_FILE" >&2
}

# --- Check for Root Privilages ---
if [[ $EUID -ne 0 ]]; then
    log_error "This script must be run as root."
    echo "Please run: sudo $0"
    exit 1
fi

# -- Function to Generate a Strong Password --
generate_password() {
    local length=${1:-$MIN_PASS_LENGTH}
    tr -dc 'A-Za-z0-9!@#$%^&*()_+-=' < /dev/urandom | head -c "$length"
}

# -- Main Script Logic --
clear
echo "=================================================="
echo "        User Creation and Configuration"
echo "=================================================="   

read -p "Enter the new username: " USERNAME
if [[ -z "$USERNAME" ]]; then
    log_error "Username cannot be empty."
    exit 1
fi

# Check if user already exists
if id $USERNAME &>/dev/null; then
    log_error "User '$USERNAME' already exists. Exiting."
    exit 1
fi

read -p "Add user '$USERNAME' to the '$SUDO_GROUP' group for sudo privileges? (y/n): " ADD_TO_SUDO
ADD_TO_SUDO=${ADD_TO_SUDO,,}  # Convert to lowercase

read -p "Enter additional groups for the user (comma-separated, e.g., 'www-data,developers'): " ADDITIONAL_GROUPS

# --- Create the User ---
log_action "Creating user '$USERNAME' with home directory and shell '$DEFAULT_SHELL'."
if ! useradd -m -s "$DEFAULT_SHELL" "$USERNAME"; then
    log_error "Failed to crete user '$USERNAME'. Check logs."
    exit 1
fi

# --- Add the User to Groups ---
if [[ "$ADD_TO_SUDO" == "y" ]]; then
    log_action "Adding user '$USERNAME' to group '$SUDO_GROUP'."
    if ! usermod -aG "$SUDO_GROUP" "$USERNAME"; then
        log_error "Error adding user '$USERNAME' to '$SUDO_GROUP'."
        # Do not exit, error is not critical for user creation
    fi
fi

if [[ -n "$ADDITIONAL_GROUPS" ]]; then
    IFS=',' read -ra AD_GROUPS_ARRAY  <<< "$ADDITIONAL_GROUPS"
    for GRP in "${AD_GROUPS_ARRAY[@]}"; do
        GRP=$(echo "$GRP" | xargs) # Remove leading/trailing spaces
        if getent group "$GRP" &>/dev/null; then
            log_action "Adding user '$USERNAME' to group '$GRP'."
            if ! usermod -aG "$GRP" "$USERNAME"; then
                log_error "Failed to add user '$USERNAME' to group '$GRP'."
            fi
        else
            log_error "Group '$GRP' does not exist. Skipped."
        fi
    done
fi 

# --- Password Setup ---
read -p "Generate a strong password for '$USERNAME'? (y/n): " GENERATE_PASS
GENERATE_PASS=${GENERATE_PASS,,}     # converting to lowercase

NEW_PASSWORD=""
if [[ "$GENERATE_PASS" == "y" ]]; then
    NEW_PASSWORD=$(generate_password)
    log_action "Generated password for '$USERNAME': $NEW_PASSWORD"
    echo "Generated passord for $USERNAME: $NEW_PASSWORD"
    echo "PLEASE WRITE DOWN THIS PASSWORD! It will not be displayed again."
else
    # Prompt for password twice for confirmation
    while true; do
        read -s -p "Enter password for '$USERNAME': " NEW_PASSWORD
        echo
        read -s -p "Confirm password: " NEW_PASSWORD_CONFIRM
        echo
        if [[ "$NEW_PASSWORD" == "$NEW_PASSWORD_CONFIRM" ]]; then
            break
        else 
            log_error "Passwords do not match. Please try again."
            echo "Passwords do not match. Please try again."
        fi
    done
fi

# Set the password
log_action "Setting password for user '$USERNAME'."
echo "$USERNAME:$NEW_PASSWORD" | chpasswd
if [[ $? -ne 0 ]]; then
    log_error "Failed to set password for user '$USERNAME'."
    exit 1
fi

# --- Password Expiration and Forced Change ---
if ! chage -M "$PASSWORD_EXPIRATION_DAYS" -m "$MIN_DAYS_BEFORE_CHANGE" -d 0 "$USERNAME"; then
    log_error "Failed to configure password expiration for '$USERNAME'."
fi
# -M <max_days>: Maximum number of days the password is valid
# -m <min_days>: Minimum number of days before the user can change the password
# -d 0: Forces password change on first login

# --- Home Directory Permissions (defaulting to 700) ---
# useradd already sets 700 by default, but we can verify or change if needed
log_action "Verifying permissions for home directory '/home/$USERNAME'."
if [[ ! -d "/home/$USERNAME" ]]; then
    log_error "Home directory '/home/$USERNAME' does not exist."
else
    # Ensure permissions are 700 (rwx------) - only owner has access
    if ! chmod 700 "/home/$USERNAME"; then
        log_error "Failed to set 700 permissions for '/home/$USERNAME'."
    fi
    if ! chown "$USERNAME:$USERNAME" "/home/$USERNAME"; then
        log_error "Failed to set owner for '/home/$USERNAME'."
    fi
fi

echo "==================================================="
log_action "User '$USERNAME' successfully created and configured."
echo "User '$USERNAME' successfully created and configured."
echo "Recommendations:"
echo "  - Communicate the password to the user (if generated)."
echo "  - Ensure the user changes the password upon first login."
echo "  - Check the log file '$LOG_FILE' for detailed information."
echo "==================================================="

exit 0