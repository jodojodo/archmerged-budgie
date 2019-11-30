#!/bin/bash
# can not be used here set -e
##################################################################################################################
# Author	:	Erik Dubois
# Website	:	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo "Installing all needed software for zsh use and theming"

sh ../AUR/install-zsh-v*.sh

echo "Install custom plugins"

git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
sed -i 's/plugins=(/plugins=(k /g' $HOME"/.zshrc"

git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k
sed -i 's/ZSH_THEME=\".*"/ZSH_THEME=\"powerlevel9k\/powerlevel9k\"/g' $HOME"/.zshrc"

#Nerdfonts sind buggy irgendwie
#sed -i '1s/^/POWERLEVEL9K_MODE=\"nerdfont-complete\"\n/' $HOME"/.zshrc"

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "sudo chsh username -s /bin/zsh"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "Log off or reboot to see the change in your terminal".
echo "--------------------------------------------------------------"

echo "################################################################"
echo "####        Software from AUR Repository installed        ######"
echo "################################################################"
