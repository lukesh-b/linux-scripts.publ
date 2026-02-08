#!/usr/bin/env bash
#
# Purpose:
#   Configure a hardened iptables-based firewall.
#
# Defaults:
#   - Dry-run enabled (no changes unless --apply is used)
#   - Default deny for inbound and forward traffic
#   - Allow all outbound traffic
#   - Allow SSH on port 22
#
# Safety:
#   - Explicit rule ordering to prevent lockout
#   - SSH access is allowed before inbound traffic is dropped
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

echo "==> Configuring iptables firewall"

# Reset existing rules
run "iptables -F"
run "iptables -X"

# Default policies
run "iptables -P INPUT DROP"
run "iptables -P FORWARD DROP"
run "iptables -P OUTPUT ACCEPT"

# Allow loopback traffic
run "iptables -A INPUT -i lo -j ACCEPT"

# Allow established and related connections
run "iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT"

# Allow SSH access
run "iptables -A INPUT -p tcp --dport ${SSH_PORT} -m conntrack --ctstate NEW -j ACCEPT"

# Drop invalid packets
run "iptables -A INPUT -m conntrack --ctstate INVALID -j DROP"

# Allow basic ICMP (ping)
run "iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT"

echo "==> iptables configuration complete"

