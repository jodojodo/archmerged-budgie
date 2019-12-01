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

echo "Customize .zshrc"
#Uncomment PATH Variable and add .local/bin
sed -i 's/# export PATH=\$HOME\/bin:\/usr\/local\/bin:\$PATH/export PATH=\$HOME\/.local\/bin:\$PATH/g' $HOME"/.zshrc"


echo "Install custom plugins"

#Install VI-mode für ZSH
sed -i 's/plugins=(/plugins=(vi-mode /g' $HOME"/.zshrc"

#Install k as a better l for ZSH
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
sed -i 's/plugins=(/plugins=(k /g' $HOME"/.zshrc"

#Install Powerlevel9k Theme
git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k
sed -i 's/ZSH_THEME=\".*"/ZSH_THEME=\"powerlevel9k\/powerlevel9k\"/g' $HOME"/.zshrc"
sed -i '1s/^/POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir_writable dir vcs)\n/' $HOME"/.zshrc"
sed -i '1s/^/POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time ssh vi_mode)\n/' $HOME"/.zshrc"
sed -i '1s/^/POWERLEVEL9K_PROMPT_ON_NEWLINE=true\n/' $HOME"/.zshrc"

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
