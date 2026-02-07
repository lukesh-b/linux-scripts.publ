#!/usr/bin/env bash
#
# ssh_audit.sh
#
# Audits SSH daemon configuration, status, ports, and authentication behavior.
# This script is read-only and does not modify any system settings

#!/usr/bin/env bash
set -euo pipefail

SSHD_CONFIG="/etc/ssh/sshd_config"

echo "===== SSH AUDIT ====="
echo

if [[ ! -f "$SSHD_CONFIG" ]]; then
  echo "[-] sshd_config not found"
  exit 1
fi

echo "[+] SSH Version:"
ssh -V 2>&1

echo
echo "[+] SSH Service Status:"
systemctl status sshd --no-pager 2>/dev/null || service ssh status

echo
echo "[+] Key SSH Settings:"
grep -Ei '^(Port|PermitRootLogin|PasswordAuthentication|PubkeyAuthentication|AllowUsers|AllowGroups|MaxAuthTries|LoginGraceTime)' "$SSHD_CONFIG" \
  | sed 's/^/    /'

echo
echo "[+] Listening SSH Ports:"
ss -tulpn | grep sshd || netstat -tulpn | grep sshd

echo
echo "[+] Failed SSH Login Attempts (last 20):"
grep -i "failed" /var/log/auth.log 2>/dev/null | tail -20 || echo "    auth.log not accessible"

echo
echo "===== SSH AUDIT COMPLETE ====="

.
