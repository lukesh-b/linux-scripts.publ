#!/usr/bin/env bash
#
# audit_users.sh
#
# Audits Linux system users, groups, sudo privileges, and inactive accounts.
# Read-only script, does not modify any users.


set -euo pipefail

echo "===== USER AUDIT ====="
echo

echo "[+] List of system users (UID < 1000):"
awk -F: '($3 < 1000){print $1,$3,$6}' /etc/passwd

echo
echo "[+] List of regular users (UID >= 1000):"
awk -F: '($3 >= 1000){print $1,$3,$6}' /etc/passwd

echo
echo "[+] Sudo users:"
getent group sudo | awk -F: '{print $4}'

echo
echo "[+] Users with no shell or disabled login:"
awk -F: '($7=="/usr/sbin/nologin" || $7=="/bin/false"){print $1,$7}' /etc/passwd

echo
echo "[+] Recently logged in users:"
lastlog | head -10

echo
echo "===== USER AUDIT COMPLETE ====="

