# Security Scripts

This project contains Linux shell scripts focused on **system security**, including auditing, hardening, firewall configuration, and user access control.

The scripts are designed to be:
- Modular
- Easily auditable
- Safe by default (many support dry-run mode)
---

## Directory Structure

```text
security/
├── audit/        # Security checks without system modification
├── hardening/    # System hardening scripts
├── firewall/     # Firewall setup and management
├── users/        # User and permission enforcement
├── logs/         # Log monitoring and analysis
├── utils/        # Shared helper functions
├── config/       # Secure configuration templates
└── tests/        # Validation and smoke tests
```


## Usage

```bash
chmod +x *.sh // Make Script Executable
./harden_ssh.sh // Test by running a script
sudo ./setup_ufw.sh // Some script requires sudo privilege
```

