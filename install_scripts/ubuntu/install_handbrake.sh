#!/bin/bash

# Handbrake install for linux
# Ref:
#   * https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases

echo "Adding handbrake apt repository"
sudo add-apt-repository ppa:stebbins/handbrake-releases
sudo apt-get update

echo "Installing handbrake"
sudo apt-get install handbrake-gtk
sudo apt-get install handbrake-cli
