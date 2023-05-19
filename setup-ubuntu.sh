#!/bin/bash

## Ubuntu default commands
sudo apt update && apt upgrade


## Development Softwares
sudo apt install code git sassc libglib2.0-dev-bin libglib2.0-dev libxml2-utils fonts-jetbrains-mono
sudo snap install insomnia
sudo snap install node --classic


## Themes
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git ~/Downloads/WhiteSur
chmod +x ~/Downloads/WhiteSur/install.sh
chmod +x ~/Downloads/WhiteSur/tweaks.sh
~/Downloads/WhiteSur/install.sh -c Dark -N Mojave
~/Downloads/WhiteSur/tweaks.sh -f monterey


## ZSH, OhMyZSH and Plugins
apt install zsh

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
wget -O ~/.zshrc https://raw.githubusercontent.com/N0-CL1CK/linux-setups/main/.zshrc
