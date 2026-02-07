#!/usr/bin/env bash
#
# package_audit.sh
#
# Audits installed packages, available security updates, and potentially insecure or legacy network services.
# This script performs no package installation or removal.

#!/usr/bin/env bash
set -euo pipefail

echo "===== PACKAGE AUDIT ====="
echo

if command -v apt >/dev/null 2>&1; then
  PKG_MGR="apt"
elif command -v dnf >/dev/null 2>&1; then
  PKG_MGR="dnf"
elif command -v yum >/dev/null 2>&1; then
  PKG_MGR="yum"
else
  echo "[-] Unsupported package manager"
  exit 1
fi

echo "[+] Package Manager: $PKG_MGR"
echo

echo "[+] Total Installed Packages:"
case "$PKG_MGR" in
  apt) dpkg -l | wc -l ;;
  dnf|yum) rpm -qa | wc -l ;;
esac

echo
echo "[+] Available Security Updates:"
case "$PKG_MGR" in
  apt) apt list --upgradable 2>/dev/null | grep -i security || echo "    none" ;;
  dnf) dnf updateinfo list security 2>/dev/null || echo "    none" ;;
  yum) yum updateinfo list security 2>/dev/null || echo "    none" ;;
esac

echo
echo "[+] Installed Network Services:"
ss -tulpn | awk '{print $1, $5, $7}' | sort -u

echo
echo "[+] Suspicious / Legacy Packages:"
case "$PKG_MGR" in
  apt) dpkg -l | grep -E 'telnet|rsh|ftp' || echo "    none found" ;;
  dnf|yum) rpm -qa | grep -E 'telnet|rsh|ftp' || echo "    none found" ;;
esac

echo
echo "===== PACKAGE AUDIT COMPLETE ====="



