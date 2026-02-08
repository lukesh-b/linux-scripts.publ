# Firewall Module

This directory contains Linux firewall management scripts focused on
secure defaults, auditability, and operational safety. All scripts are
**dry-run by default** and require explicit action to apply changes.

---

## Scripts Overview

### `flush_rules.sh`

**Purpose**  
Safely flush all existing iptables firewall rules and reset policies.

**Defaults**  
- Dry-run enabled
- No system changes unless `--apply` is used

---

### `setup_iptables.sh`

**Purpose**  
Configure a hardened iptables-based firewall ruleset.

**Defaults**  
- Dry-run enabled  
- Deny all inbound and forwarded traffic  
- Allow all outbound traffic  
- Allow SSH on port 22 (configurable)

---

### `setup_ufw.sh`

**Purpose**  
Configure a secure UFW (Uncomplicated Firewall) ruleset.

**Defaults**  
- Dry-run enabled  
- Deny all incoming traffic  
- Allow all outgoing traffic  
- Allow SSH on port 22 (configurable)

---

## Safety Notes

- Always review rules before applying them
- Test locally or with console access when possible
- Firewall persistence is intentionally not handled by these scripts

---

## License

MIT (or align with parent repository)

