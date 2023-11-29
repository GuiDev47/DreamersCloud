#!/bin/bash

# Run the following command to uninstall all conflicting packages
#for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done


# Add Docker's official GPG key:
sudo apt-get update
sudo dpkg --configure -a
echo 1
sudo apt-get install -y ca-certificates curl gnupg
echo 2
sudo install -m 0755 -d /etc/apt/keyrings 
echo 3
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo 4
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo 5

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo 6
sudo apt-get update
echo 7

#To install the latest version, run
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo 8

git clone https://github.com/imyoungyang/docker-pacman.git
echo 9
cd docker-pacman
echo 10
docker build . -t pacman
echo 11
docker run --name pacman -d -p 8080:80 pacman
echo 12
