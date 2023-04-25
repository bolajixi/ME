#!/bin/sh

# Install Git, Docker && Docker-compose
sudo apt-get update -y install git docker.io docker-compose -y 

# Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version
docker --version
git --version

# Get the Scripts
git clone https://github.com/bolajixi/ME.git MediaEngine

# Change into the director
cd MediaEngine

# Deploy the application using Docker Compose
sudo docker-compose -f restream-app.yml up -d 

# Verify that the container is up and running
docker ps

# docker run -p 1935:1935 MediaEngine