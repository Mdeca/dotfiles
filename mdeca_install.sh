#!/bin/bash
# Simple script to setup dev environment
#
## 


echo "Mdeca dev script"
read -p "Press enter to continue."


# add repository's :
sudo add-apt-repository ppa:jonathonf/backports -y
sudo add-apt-repository ppa:jonathonf/python-3.6 -y

# Update and upgrade:
sudo apt-get update
sudo apt-get -y upgrade

# Install python3.6:
sudo apt-get install -y python3.6

# Install git-core:
sudo apt-get install -y git-core

# Install zsh and ohmyzsh:
sudo apt-get install -y zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# Import dotfiles from github:
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
dotfiles config --local status.showUntrackedFiles no
git clone --bare https://github.com/Mdeca/dotfiles.git $HOME/.dotfiles.git
dotfiles checkout

# Cleaning:
echo "Cleaning Up" &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

# Change default shell:
chsh -s $(which zsh)
source $HOME/.zshrc

read -p "Done !! Press enter to reboot"
reboot

#END#