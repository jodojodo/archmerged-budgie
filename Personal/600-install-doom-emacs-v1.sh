#!/bin/bash
set -e

echo "Clone and install Doom Emacs"

if [ -d $HOME"/.emacs.d" ]; then
	echo "Create Backup of old .emacs.d folder?? (Y|n)"
	read input
	if [ "$input" != "n" ]; then
		echo "Create Backup (and delete old Backup if necessary)"
		[ -d $HOME"/.emacs.d.bak" ] && rm -rf $HOME"/.emacs.d.bak"
		mv $HOME"/.emacs.d" $HOME"/.emacs.d.bak" 
	else
		echo "Remove old .emacs.d folder."
		rm -rf $HOME"/.emacs.d"
	fi
fi
git clone https://github.com/hlissner/doom-emacs $HOME"/.emacs.d"

echo "Run the doom install script"
$HOME"/.emacs.d/bin/doom" install
$HOME"/.emacs.d/bin/doom" update

echo "################################################################"
echo "###                Doom Emacs was installed                 ####"
echo "################################################################"
