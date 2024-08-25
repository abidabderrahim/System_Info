# System Information Tool - Bash Script

## Overview

This Bash script collects and displays various system information, including details about the operating system, user information, memory usage, connected devices, installed applications, network status, battery status, and more. It is designed to be comprehensive and useful for system monitoring and diagnostics.

## Features

- **OS Information**: Displays the operating system, kernel version, and architecture.
- **System Uptime**: Shows how long the system has been running.
- **User Information**: Details about the current user, home directory, and shell.
- **CPU Information**: Shows CPU model, number of cores, and current load percentage.
- **Memory Usage**: Provides total, used, and free memory in human-readable format.
- **Disk Usage**: Displays the disk usage for all mounted filesystems.
- **Network Information**: Lists network interfaces, IP addresses, and MAC address.
- **Battery Status**: Displays battery status and capacity (for laptops).
- **Installed Applications**: Lists installed packages based on the package manager.
- **System Errors**: Shows the last 10 lines of the kernel message buffer (`dmesg`).
- **Connected Devices**: Lists all connected block devices using `lsblk`.
- **Running Processes**: Displays the top 10 CPU-consuming processes.

## Requirements

- **Bash**: The script is written in Bash and should be run in a Unix-like environment.
- **Basic Command-Line Tools**: The script uses standard tools like `uname`, `whoami`, `top`, `free`, `df`, `ip`, `lsblk`, and `ps`.
- **Package Manager**: The script detects and lists installed packages using `dpkg`, `rpm`, `pacman`, or `apk` based on the system.

## How to Use

### 1. Save the Script

Save the script as `System_Info.sh`.

### 2. Make the Script Executable

Run the following command to make the script executable:

```bash
chmod +x System_Info.sh
./System_Info.sh
