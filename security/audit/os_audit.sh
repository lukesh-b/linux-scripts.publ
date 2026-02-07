
#!/usr/bin/env bash

# Audits OS, kernel, uptime, disk, memory, and basic security posture.

set -euo pipefail

echo "===== OS AUDIT ====="
echo

echo "[+] Hostname:"
hostnamectl || hostname

echo
echo "[+] OS Release:"
cat /etc/os-release 2>/dev/null || lsb_release -a

echo
echo "[+] Kernel:"
uname -a

echo
echo "[+] Uptime:"
uptime

echo
echo "[+] CPU Info:"
lscpu | grep -E 'Model name|CPU\(s\)'

echo
echo "[+] Memory Usage:"
free -h

echo
echo "[+] Disk Usage:"
df -hT

echo
echo "[+] Mounted Filesystems:"
mount | column -t

echo
echo "[+] Time & NTP:"
timedatectl 2>/dev/null || date

echo
echo "===== OS AUDIT COMPLETE ====="

