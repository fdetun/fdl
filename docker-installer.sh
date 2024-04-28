#!/bin/bash

# Update the apt package index
sudo apt-get update


# Docker
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y

sudo systemctl start docker

# Add the current user to the docker group to run docker commands without sudo
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

echo "You need to log out and log back in to apply group changes or you can use the 'newgrp docker' command in your current session."

