#!/bin/bash

# MakeMKV installation for linux.
# Ref:
#   * https://www.makemkv.com/forum/viewtopic.php?f=3&t=224
#   * https://www.makemkv.com/download/

BIN_NAME="makemkv-bin-1.14.4"
OSS_NAME="makemkv-oss-1.14.4"
BIN_URL="http://www.makemkv.com/download/$BIN_NAME.tar.gz"
OSS_URL="http://www.makemkv.com/download/$OSS_NAME.tar.gz"
DL_DIR="$HOME/Downloads"

echo "Downloading makemkv source files"
wget $BIN_URL -P $DL_DIR
wget $OSS_URL -P $DL_DIR

echo "Installing required tools"
sudo apt-get install build-essential pkg-config libc6-dev libssl-dev \
    libexpat1-dev libavcodec-dev libgl1-mesa-dev libqt4-dev zlib1g-dev -y

echo "Unpacking source files"
cd $DL_DIR
tar -zxvf $BIN_NAME.tar.gz
tar -zxvf $OSS_NAME.tar.gz

echo "Installing $OSS_NAME"
cd $DL_DIR/$OSS_NAME
./configure
make
sudo make install

echo "Installing $BIN_NAME"
cd $DL_DIR/$BIN_NAME
make
sudo make install

echo "Cleaning up"
rm $DL_DIR/$OSS_NAME.tar.gz
rm $DL_DIR/$BIN_NAME.tar.gz
rm -fr $DL_DIR/$OSS_NAME
rm -fr $DL_DIR/$BIN_NAME
