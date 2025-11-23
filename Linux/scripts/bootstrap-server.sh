#!/usr/bin/env bash
# bootstrap-server.sh
set -euo pipefail

log() { echo "[$(date +'%H:%M:%S')] $*"; }

log "Updating system"
apt update && apt upgrade -y

log "Installing common tools"
apt install -y curl wget git vim htop jq tree docker.io

log "Creating devops user"
useradd -m -s /bin/bash devops
usermod -aG sudo,docker devops

log "Setting up SSH key (replace with your real key!)"
mkdir -p /home/devops/.ssh
echo "ssh-ed25519 YOUR_PUBLIC_KEY_HERE" > /home/devops/.ssh/authorized_keys
chown -R devops:devops /home/devops/.ssh
chmod 700 /home/devops/.ssh
chmod 600 /home/devops/.ssh/authorized_keys

log "Server bootstrapped and ready!"