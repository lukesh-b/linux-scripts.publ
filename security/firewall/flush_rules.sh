#!/usr/bin/env bash
#
# Purpose:
#   Safely flush all iptables firewall rules and reset policies.
#
# Defaults:
#   - Dry-run enabled (no system changes unless --apply is used)
#   - Policies reset to ACCEPT only when explicitly applied
#
# Safety:
#   - Does not modify the system unless --apply is provided
#   - Intended for recovery or controlled firewall resets
#

set -euo pipefail

DRY_RUN=true

usage() {
  echo "Usage: $0 [--apply]"
  echo "  --apply    Actually flush firewall rules"
  exit 1
}

if [[ "${1:-}" == "--apply" ]]; then
  DRY_RUN=false
elif [[ "${1:-}" != "" ]]; then
  usage
fi

run() {
  if $DRY_RUN; then
    echo "[DRY-RUN] $*"
  else
    eval "$@"
  fi
}

echo "==> Flushing firewall rules (iptables)"

run "iptables -F"
run "iptables -X"
run "iptables -t nat -F"
run "iptables -t nat -X"
run "iptables -t mangle -F"
run "iptables -t mangle -X"

run "iptables -P INPUT ACCEPT"
run "iptables -P FORWARD ACCEPT"
run "iptables -P OUTPUT ACCEPT"

echo "==> Done"

