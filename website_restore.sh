#!/bin/bash

DESTINATION="/var/www/html"
BUCKET="s3://atharva-aws-ha-web-server/website-backup"

echo "Starting website restoration..."

sudo aws s3 sync "$BUCKET" "$DESTINATION"

if [ $? -eq 0 ]; then
    echo "Website restoration completed successfully."
else
    echo "Website restoration failed."
    exit 1
fi
