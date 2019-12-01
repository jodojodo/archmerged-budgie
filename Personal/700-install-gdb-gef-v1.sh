#!/bin/bash
set -e

echo "Clone and install GDB GEF extension"

wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

echo "Install additional dependencies"

sudo pip3 install keystone-engine
sudo pip3 install unicorn
sudo pip3 install capstone
sudo pip3 install ropper


echo "################################################################"
echo "###                GDB GEF was installed                 ####"
echo "################################################################"
