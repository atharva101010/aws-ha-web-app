#!/bin/bash

SOURCE="/data/application/application-data.txt"
BUCKET="s3://atharva-aws-ha-web-server"
BACKUP_NAME="application-data-$(date +%Y-%m-%d-%H%M%S).txt"

echo "Starting s3 backup now"

aws s3 cp "$SOURCE" "$BUCKET/$BACKUP_NAME"

if [ $? -eq 0 ]; then
    echo "Backup completed successfully: $BACKUP_NAME"
else
    echo "Backup failed"
    exit 1
fi
