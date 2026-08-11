#!/bin/bash
 
echo "Starting the web server setup"

sudo apt update -y
sudo apt install nginx -y
sudo apt install git -y

sudo systemctl start nginx
sudo systemctl enable nginx

git clone https://github.com/atharva101010/aws-ha-web-app.git
cd aws-ha-web-app
sudo cp aws-ha-web-app/index.html /var/www/html
sudo cp aws-ha-web-app/style.css /var/www/html

echo "Web server setup completed successfully"
