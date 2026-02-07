#!/usr/bin/env bash
#
# enforce_password_policy.sh
#
# Checks Linux password policy settings such as minimum length, complexity,
# and expiration. Read-only, reports potential issues but does not modify users.


set -euo pipefail

echo "===== PASSWORD POLICY AUDIT ====="
echo

if [[ -f /etc/login.defs ]]; then
  echo "[+] /etc/login.defs settings:"
  grep -E 'PASS_MAX_DAYS|PASS_MIN_DAYS|PASS_WARN_AGE|PASS_MIN_LEN' /etc/login.defs | sed 's/^/    /'
else
  echo "[-] /etc/login.defs not found"
fi

echo
if [[ -f /etc/pam.d/common-password ]]; then
  echo "[+] PAM password complexity rules:"
  grep -E 'pam_cracklib.so|pam_pwquality.so' /etc/pam.d/common-password | sed 's/^/    /'
else
  echo "[-] PAM password module not found or not Linux-Debian based"
fi

echo
echo "===== PASSWORD POLICY AUDIT COMPLETE ====="

