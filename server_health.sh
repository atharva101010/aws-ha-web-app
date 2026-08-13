#!/bin/bash

LOG_FILE="/var/log/server_health.log"

echo "====================================" >> "$LOG_FILE"
echo "Server Health Check" >> "$LOG_FILE"
echo "Date: $(date)" >> "$LOG_FILE"
echo "====================================" >> "$LOG_FILE"

echo "CPU Load:" >> "$LOG_FILE"
uptime >> "$LOG_FILE"

echo "" >> "$LOG_FILE"
echo "Memory Usage:" >> "$LOG_FILE"
free -h >> "$LOG_FILE"

echo "" >> "$LOG_FILE"
echo "Disk Usage:" >> "$LOG_FILE"
df -h / >> "$LOG_FILE"

echo "" >> "$LOG_FILE"
echo "Nginx Status:" >> "$LOG_FILE"

if systemctl is-active --quiet nginx
then
    echo "Nginx: RUNNING" >> "$LOG_FILE"
else
    echo "Nginx: NOT RUNNING" >> "$LOG_FILE"
fi

echo "" >> "$LOG_FILE"
echo "Health check completed." >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
