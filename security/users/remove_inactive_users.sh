#!/usr/bin/env bash
#
# remove_inactive_users.sh
#
# Reports Linux users who have not logged in for a configurable number of days.
# Read-only, does not delete any users.


set -euo pipefail

THRESHOLD_DAYS=90

echo "===== INACTIVE USER REPORT (>${THRESHOLD_DAYS} days) ====="
echo

while IFS=: read -r username _ uid _ _ home shell; do
  if [[ $uid -ge 1000 && -d "$home" ]]; then
    last_login=$(lastlog -u "$username" | awk 'NR==2 {print $4,$5,$6}')
    if [[ -z "$last_login" || "$last_login" == "**Never logged in**" ]]; then
      echo "[+] $username: never logged in"
    else
      last_epoch=$(date -d "$last_login" +%s 2>/dev/null || echo 0)
      now_epoch=$(date +%s)
      inactive_days=$(( (now_epoch - last_epoch) / 86400 ))
      if (( inactive_days > THRESHOLD_DAYS )); then
        echo "[+] $username: inactive for $inactive_days days"
      fi
    fi
  fi
done < /etc/passwd

echo
echo "===== INACTIVE USER REPORT COMPLETE ====="

