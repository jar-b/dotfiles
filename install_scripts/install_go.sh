#!/bin/bash

VERSION="1.12.1"
OS="linux"
ARCH="amd64"

echo "Downloading Go version $VERSION"
wget "https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz"

echo "Installing Go version $VERSION"
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

echo "Cleaning up..."
rm go$VERSION.$OS-$ARCH.tar.gz
