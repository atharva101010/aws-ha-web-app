#!/bin/bash

SOURCE="/var/www/html"
BUCKET="s3://atharva-aws-ha-web-server/website-backup"

echo "Starting website backup..."

aws s3 sync "$SOURCE" "$BUCKET"

if [ $? -eq 0 ]; then
    echo "Website backup completed successfully."
else
    echo "Website backup failed."
    exit 1
fi
