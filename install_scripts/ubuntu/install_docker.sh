#!/bin/bash

# A script to execute the commands recommended for installing docker CE,
# as documented here:
#   * https://docs.docker.com/install/linux/docker-ce/ubuntu/

# 1. Update the apt package index:
echo "Updating package index"
sudo apt-get update

# 2. Install packages to allow apt to use a repository over HTTPS:
echo "Installing dependencies"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# 3. Add Docker’s official GPG key:
echo "Adding Docker's official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# 4. Use the following command to set up the stable repository (x86_64/amd64 tab):
echo "Setting up apt repository"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# 5. Install the latest version of Docker CE and containerd:
echo "Install Docker CE"
sudo apt-get install docker-ce docker-ce-cli containerd.io



## Post-Install steps (optional), used to create the docker group and add
## non-root users to allow use of docker commands without `sudo`
##   * https://docs.docker.com/install/linux/linux-postinstall/

## 1. Create the docker group
#sudo groupadd docker

## 2. Add your user to the docker group
#sudo usermod -aG docker $USER
