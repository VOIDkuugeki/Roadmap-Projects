#!/bin/bash

# # CPU Usage:
top -bn1 | grep "%Cpu" | grep -oP '\d+\.\d+(?=\s*id)' | awk '{print "CPU Usage: " 100 - $1 "%"}'
top -bn1 | grep "%Cpu" | awk -F',' '{for(i=1;i<=NF;i++){if($i ~ /id/){gsub(/[^0-9.]/,"",$i); print "CPU Usage: " 100 - $i "%"}}}'
echo

# Memory Usage:
free -h | awk '
/Mem/ {
    # strip units
    gsub(/[^0-9.]/,"",$2)
    gsub(/[^0-9.]/,"",$3)
    gsub(/[^0-9.]/,"",$4)

    total=$2
    used=$3
    avail=$4

    used_pct = (used/total)*100
    avail_pct = (avail/total)*100

    printf "Memory Usage:\n"
    printf "\tTotal: %.2f Gi\n", total
    printf "\tUsed: %.2f Gi (%.1f%%)\n", used, used_pct
    printf "\tAvailable: %.2f Gi (%.1f%%)\n", avail, avail_pct
}'
echo

# # Disk Usage:
df -h --total | awk '
/total/ {
    total_raw=$2
    used_raw=$3
    avail_raw=$4

    # remove units
    gsub(/[^0-9.]/,"",$2)
    gsub(/[^0-9.]/,"",$3)
    gsub(/[^0-9.]/,"",$4)

    total=$2
    used=$3
    avail=$4

    used_pct = (used/total)*100
    avail_pct = (avail/total)*100

    printf "Disk Usage:\n"
    printf "\tTotal: %s\n", total_raw
    printf "\tUsed: %s (%.1f%%)\n", used_raw, used_pct
    printf "\tAvailable: %s (%.1f%%)\n", avail_raw, avail_pct
}'
echo

# Top 5 processes by CPU usage
echo "Top 5 processes by CPU usage:"
ps -eo pid,comm,%cpu --sort=%cpu | head -n 6
echo

# Top 5 processes by memory usage
echo "Top 5 processes by memory usage:"
ps -eo pid,comm,%mem --sort=%mem | head -n 6
echo