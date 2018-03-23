#!/bin/bash
# Mdece_dotfiles.sh
#
##

echo "Mdeca_Dotfiles.sh"
read -p "Press enter to continue."

echo "Setting dotfiles alias"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

echo "Cloning the repository"
git clone --bare https://github.com/Mdeca/dotfiles.git $HOME/.dotfiles.git
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

echo "Checkout from master"
dotfiles checkout -f

echo "Config Git"
nano $HOME/.gitconfig

echo "Source the new .zshrc"
source $HOME/.zshrc

echo "Show repository status"
dotfiles status

## End #
