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
sudo sed -i '5iENABLED=1' /etc/default/stunnel4
sudo cp stunnel.conf /etc/stunnel/stunnel.conf

# Deploy the application using Docker Compose
sudo docker-compose -f restream-app.yml up -d 

# Start stunnel service
# sudo systemctl start stunnel4

# Enable stunnel after boot
sudo systemctl enable stunnel4.service

# Restart stunnel
sudo systemctl restart stunnel4.service

# Verify that the container is up and running
docker ps