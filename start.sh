#!/bin/sh

# Update package list
sudo apt-get update

# Install Docker && Docker-compose
sudo apt-get -y install docker.io docker-compose

# Verify that Docker and Docker Compose are installed
docker --version
docker-compose --version

# Install stunnel to tunnel RTMP to RTMPS
sudo apt-get install stunnel4

# Configure stunnel
sudo cp stunnel.conf /etc/stunnel/stunnel.conf
sudo sed -i '5iENABLED=1' /etc/default/stunnel4

# Prepare SSL certificate
# sudo openssl req -new -x509 -days 1000 -nodes -out /etc/ssl/certs/stunnel.pem -keyout /etc/ssl/certs/stunnel.pem

# sudo openssl x509 -outform pem -in /etc/ssl/certs/stunnel.pem -out /etc/ssl/certs/stunnel.crt
# sudo openssl rsa -outform pem -in /etc/ssl/certs/stunnel.pem -out /etc/ssl/certs/stunnel.key

# Restart stunnel service
# systemctl restart stunnel4.service

# Deploy the application using Docker Compose
sudo docker-compose -f restream-app.yml up -d 

# Verify that the container is up and running
docker ps