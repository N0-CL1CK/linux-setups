#!/bin/bash

## Warning
echo "[AVISO] Você precisa ter o arquivo ./config.json contendo o e-mail e o user que será usado no Git. Você gostaria de continuar? [s/n]"
read res

if [ "$res" = "n" ] || [ "$res" = "N" ]; then
  exit 0
fi

yes | {
  ## Ubuntu default commands
  sudo apt update && sudo apt upgrade


  ## Development Softwares
  sudo apt install git fonts-jetbrains-mono jq
  sudo snap install code --classic
  sudo snap install insomnia


  ## Node set up
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  source ~/.zshrc
  nvm install lts/hydrogen

  ## Git set up
  if [ -f "./config.json" ]; then
    email=$(cat ./config.json | jq '.email')
    user=$(cat ./config.json | jq '.user')

    git config --global user.email "$email"
    git config --global user.name "$user"

    ssh-keygen -t rsa -b 4096 -C "$email"
  else
    ssh-keygen -t rsa -b 4096
  fi

  ## Themes
  sudo apt install sassc libglib2.0-dev-bin libglib2.0-dev libxml2-utils chrome-gnome-shell gnome-tweaks
  git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git /home/$USER/Downloads/WhiteSur
  chmod +x /home/$USER/Downloads/WhiteSur/install.sh
  chmod +x /home/$USER/Downloads/WhiteSur/tweaks.sh
  /home/$USER/Downloads/WhiteSur/install.sh -c Dark -N Mojave
  /home/$USER/Downloads/WhiteSur/tweaks.sh -f monterey


  ## ZSH, OhMyZSH and Plugins
  sudo apt install zsh

  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
  wget -O /home/$USER/.zshrc https://raw.githubusercontent.com/N0-CL1CK/linux-setups/main/.zshrc

  sudo chsh -s $(which zsh)
}
