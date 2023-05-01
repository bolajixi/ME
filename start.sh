#!/bin/sh

# Update package list
sudo apt-get update

# Install Docker && Docker-compose
sudo apt-get -y install docker.io docker-compose

# Verify that Docker and Docker Compose are installed
docker --version
docker-compose --version

# Deploy the application using Docker Compose
sudo docker-compose -f restream-app.yml up -d 

# Verify that the container is up and running
docker ps