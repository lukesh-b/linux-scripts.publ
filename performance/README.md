# Linux Performance Scripts

This directory contains performance monitoring and basic optimization scripts for Linux systems.

## Included Scripts

1. cpu_monitor.sh  
   Displays real-time CPU usage.

2. memory_analyzer.sh  
   Shows memory usage statistics and top memory-consuming processes.

3. disk_io_monitor.sh  
   Displays extended disk I/O statistics (requires sysstat package).

4. process_profiler.sh  
   Lists top CPU and memory consuming processes.

5. optimize_sysctl.sh  
   Applies basic kernel performance tuning parameters.

## Requirements

- Bash
- sysstat package (for iostat)

Install sysstat:

Ubuntu/Debian:
    sudo apt install sysstat

RHEL/CentOS:
    sudo yum install sysstat

## Usage

Make scripts executable:

    chmod +x *.sh

Example >  Run a script:

    ./cpu_monitor.sh

## Notes

Review any system tuning parameters before applying them in production environments.
These scripts are intended for  basic administration purposes.

