#!/bin/bash

get_os_info(){
  echo "Operating Syetem : $(uname -s)"
  echo "Kernel Version : $(uname -r)"*
  echo "Architecture : $(uname -m)"
}

get_system_uptime(){
  echo "System Uptime : $(uptime -p)"
}

get_user_info(){
  echo "Current User : $(whoami)"
  echo "Home Directory : $Home"
  echo "Shell : $SHELL"
}

get_cpu_info(){
  echo "CPU Info : $(lscpu | grep 'Model name' | awk -F: '{print $2}' | xargs)"
  echo "CPU Cores : $(nproc)"
  echo "CPU Load : $(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%"
}

get_memory_info(){
  echo "Memory Usage : "
  free -h | awk 'NR==2{printf "Total: %s\nUsed: %s\nFree: %s\n", $2, $3, $4}'
}

get_disk_info(){
  echo "Disk Usage : "
  df -h | grep '^/dev/' | awk '{print $1 " - " $5 " used (" $4 " available) on " $6}'
}

get_network_info(){
  echo "Network Interfaces : "
  ip -brief addr show | awk '{print $1 ": " $3}'
  echo "IP Address : $(hostname -I | awk '{print $1}')"
  echo "MAC Address : $(ip link show $(ip route show default | awk '/default/ {print $5}') | awk '/ether/ {print $2}')"
}

get_battery_status(){
  if [ -d "/sys/class/power_supply/BAT0" ]; then
    echo "Battery Status : $(cat /sys/class/power_supply/BAT0/status)"
    echo "Battery Capacity : $(cat /sys/class/power_supply/BAT0/capacity)%"
  else
    echo "battery Status : Not Available "
  fi
}

get_installed_apps(){
  if command -v dpkg > /dev/null; then
    echo "Installed Applications (Debian-based) : "
    dpkg --get-selections | grep -v deinstall | awk '{print $1}'
  elif commnad -v rpm > /dev/null; then
    echo "Installed Applications (Red-Hat-based) : "
    rpm -qa
  elif command -v pacman > /dev/null; then
    echo "Installed Applications (Arch-based) : "
    pacman -Q
  elif command -v apk > /dev/null; then
    echo "Installed Applications (Alpine-based) : "
    apk info
  else 
    echo "Package manager not detected. Unable to list installed applications ."
  fi
}

get_system_errors(){
  echo "System Errors (last 10 lines of dmesg) : "
  dmesg | tail -10
}

get_connected_devices(){
  echo "Connected Devices : "
  lsblk
}

get_running_processes(){
  echo "Running Processes : "
  ps -e --format pid,comm,pcpu,pmem --sort=-pcpu | head -n 10
}

display_system_info(){
  echo "=== System information ==="
  get_os_info
  echo ""

  echo "***  Uptime ***"
  get_system_uptime
  echo ""

  echo "=== User Information ==="
  get_user_info
  echo ""

  echo "*** CPU Information  ***"
  get_cpu_info
  echo ""

  echo "=== Memory Information  ==="
  get_memory_info
  echo ""

  echo "*** Disk Information  ***"
  get_disk_info
  echo ""

  echo "=== Network information  ==="
  get_network_info
  echo ""

  echo "*** Battery Status ***"
  get_battery_status
  echo ""

  echo "=== Installed Applications ==="
  get_installed_apps
  echo ""

  echo "*** Connected Devices ***"
  get_connected_devices
  echo ""

  echo "=== System Errors ==="
  get_system_errors
  echo ""

  echo "*** Top Running Processes ***"
  get_running_processes
  echo ""
}

display_system_info








