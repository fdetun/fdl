#!/bin/bash

# Update the apt package index
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package index again after adding Docker repo
sudo apt-get update -y

# Install the latest version of Docker CE (Community Edition)
sudo apt-get install docker-ce -y

# Enable Docker to start on boot
sudo systemctl enable docker

# Start Docker if it's not already running
sudo systemctl start docker

# Add the current user to the docker group to run docker commands without sudo
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

# Inform the user about logging out and back in again
echo "You need to log out and log back in to apply group changes or you can use the 'newgrp docker' command in your current session."

