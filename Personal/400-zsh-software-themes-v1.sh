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

#Install Tmux für ZSH
sed -i 's/plugins=(/plugins=(tmux /g' $HOME"/.zshrc"
#Automatically starts tmux (once) <- disabled, because you don't want to run tmux within tmux.
#sed -i "1s/^/ZSH_TMUX_AUTOSTART=true\n/" $HOME"/.zshrc"
#sed -i "1s/^/ZSH_TMUX_AUTOCONNECT=false\n/" $HOME"/.zshrc"

# Expand tmux configuration so that keybinding can be used everywhere.
cat <<'EOF' >> $HOME"/.tmux.conf"

# Activate vi-mode keybindings
set-window-option -g mode-keys vi
bind -Tcopy-mode-vi 'v' send -X begin-selection
bind -Tcopy-mode-vi 'y' send -X copy-selection-and-cancel

# Enable mouse control (clickable windows, panes, resizable panes)
set -g mouse on

# don't rename windows automatically
set-option -g allow-rename off

# Split panes using | and -
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# Smart pane switching with awareness of vim or emacs splits/windows
is_vim_emacs='echo "#{pane_current_command}" | \
  grep -iqE "((^|\/)g?(view|n?vim?x?)(diff)?$)|emacs"'

# enable in root key table
bind -n C-h if-shell "$is_vim_emacs" "send-keys C-h" "select-pane -L"
bind -n C-j if-shell "$is_vim_emacs" "send-keys C-j" "select-pane -D"
bind -n C-k if-shell "$is_vim_emacs" "send-keys C-k" "select-pane -U"
bind -n C-l if-shell "$is_vim_emacs" "send-keys C-l" "select-pane -R"
bind -n C-\ if-shell "$is_vim_emacs" "send-keys C-\\" "select-pane -l"

# enable in copy mode key table
bind -Tcopy-mode-vi C-h if-shell "$is_vim_emacs" "send-keys C-h" "select-pane -L"
bind -Tcopy-mode-vi C-j if-shell "$is_vim_emacs" "send-keys C-j" "select-pane -D"
bind -Tcopy-mode-vi C-k if-shell "$is_vim_emacs" "send-keys C-k" "select-pane -U"
bind -Tcopy-mode-vi C-l if-shell "$is_vim_emacs" "send-keys C-l" "select-pane -R"
bind -Tcopy-mode-vi C-\ if-shell "$is_vim_emacs" "send-keys C-\\" "select-pane -l"



######################
### DESIGN CHANGES ###
######################

# loud or quiet?
set -g visual-activity off
set -g visual-bell off
set -g visual-silence off
setw -g monitor-activity off
set -g bell-action none

#  modes
setw -g clock-mode-colour colour5
setw -g mode-style 'fg=colour1 bg=colour18 bold'

# panes
set -g pane-border-style 'fg=colour19 bg=colour0'
set -g pane-active-border-style 'bg=colour0 fg=colour9'

# statusbar
set -g status-position bottom
set -g status-justify left
set -g status-style 'bg=colour18 fg=colour137 dim'
set -g status-left ''
set -g status-right '#[fg=colour233,bg=colour19] %d/%m #[fg=colour233,bg=colour8] %H:%M:%S '
set -g status-right-length 50
set -g status-left-length 20

setw -g window-status-current-style 'fg=colour1 bg=colour19 bold'
setw -g window-status-current-format ' #I#[fg=colour249]:#[fg=colour255]#W#[fg=colour249]#F '

setw -g window-status-style 'fg=colour9 bg=colour18'
setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '

setw -g window-status-bell-style 'fg=colour255 bg=colour1 bold'

# messages
set -g message-style 'fg=colour232 bg=colour16 bold'

EOF

#Install VI-mode für ZSH
sed -i 's/plugins=(/plugins=(vi-mode /g' $HOME"/.zshrc"

#Install Emacs Plugin für ZSH
sed -i 's/plugins=(/plugins=(emacs /g' $HOME"/.zshrc"

#Install k as a better l for ZSH
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
sed -i 's/plugins=(/plugins=(k /g' $HOME"/.zshrc"

#Install Powerlevel9k Theme
git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k
sed -i 's/ZSH_THEME=\".*"/ZSH_THEME=\"powerlevel9k\/powerlevel9k\"/g' $HOME"/.zshrc"
#Write Default User for ZSH Powerline context. sed need Doublequotes to be able to interprete the backtick ones.
sed -i "1s/^/DEFAULT_USER=`echo $USER`\n/" $HOME"/.zshrc"
sed -i '1s/^/POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir_writable dir vcs)\n/' $HOME"/.zshrc"
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
