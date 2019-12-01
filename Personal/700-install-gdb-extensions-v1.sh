#!/bin/bash
set -e

echo "Install voltron for better view controll of gdb"
git clone https://github.com/snare/voltron $HOME"/voltron"
cd $HOME"/voltron"
./install.sh

echo "Install GDB switcher with all the hacky extensions"
git clone https://github.com/2O2L2H/gdb-switcher $HOME"/gdb-switcher"
cd $HOME"/gdb-switcher/"
./install.sh
cat $HOME"/.gdbinit" >> .gdbinit-my
# Bei Bedarf setup.sh auf ZSH abändern
[[ $SHELL = '/bin/zsh' ]] && sed -i 's/bashrc/zshrc/g' setup.sh
./setup.sh

echo "Install Gef Extras"
# Make sure gdb runs with gef
cp ~/.gdbinit-gef ~/.gdbinit
# Install the scripts
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef-extras.sh | sh
# Go back to vanilla gdb
cp ~/.gdbinit-gdb ~/.gdbinit


echo "Install additional dependencies for GEF"

sudo pip3 install keystone-engine
sudo pip3 install unicorn
sudo pip3 install capstone
sudo pip3 install ropper


echo "################################################################"
echo "###               GDB Goddies were installed                ####"
echo "################################################################"
