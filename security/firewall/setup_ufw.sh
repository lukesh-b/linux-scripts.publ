#!/usr/bin/env bash
#
# Purpose:
#   Configure a secure UFW (Uncomplicated Firewall) ruleset.
#
# Defaults:
#   - Dry-run enabled (no changes unless --apply is used)
#   - Deny all incoming traffic
#   - Allow all outgoing traffic
#   - Allow SSH on port 22
#
# Safety:
#   - Firewall is fully configured before being enabled
#   - Prevents accidental lockout via dry-run default
#

set -euo pipefail

DRY_RUN=true
SSH_PORT=22

usage() {
  echo "Usage: $0 [--apply] [--ssh-port <port>]"
  exit 1
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --apply)
      DRY_RUN=false
      shift
      ;;
    --ssh-port)
      SSH_PORT="$2"
      shift 2
      ;;
    *)
      usage
      ;;
  esac
done

run() {
  if $DRY_RUN; then
    echo "[DRY-RUN] $*"
  else
    eval "$@"
  fi
}

echo "==> Configuring UFW firewall"

run "ufw --force reset"
run "ufw default deny incoming"
run "ufw default allow outgoing"
run "ufw allow ${SSH_PORT}/tcp"
run "ufw logging on"

if $DRY_RUN; then
  echo "[DRY-RUN] ufw enable"
else
  ufw --force enable
fi

echo "==> UFW configuration complete"

