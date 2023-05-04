#!/bin/sh

# Update package list
sudo apt-get update

# Install Docker && Docker-compose
sudo apt-get -y install docker.io docker-compose

# Install stunnel to tunnel RTMP to RTMPS
sudo apt-get install stunnel4

# Configure stunnel
sudo sed -i 's/ENABLE=0/ENABLE=1/' /etc/default/stunnel4
sudo cp stunnel.conf /etc/stunnel/stunnel.conf

# Verify that Docker and Docker Compose are installed
docker --version
docker-compose --version

# Deploy the application using Docker Compose
sudo docker-compose -f restream-app.yml up -d 

# Verify that the container is up and running
docker ps