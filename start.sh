#!/bin/sh

# Install Git, Docker && Docker-compose
sudo apt-get -y install git docker.io docker-compose

# Verify that Docker and Docker Compose are installed
docker --version
docker-compose --version

# Install latest version of Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl --silent https://github.com/docker/compose/releases/latest | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

docker-compose --version

# Deploy the application using Docker Compose
sudo docker-compose -f restream-app.yml up -d 

# Verify that the container is up and running
docker ps

# docker run -p 1935:1935 MediaEngine