#!/bin/bash
# Mdeca_setup.sh
#
## 

echo "Mdeca_Setup.sh"
read -p "Press enter to continue."

# add repository's :
echo "Adding Repositorys"
sudo add-apt-repository ppa:jonathonf/backports -y
sudo add-apt-repository ppa:jonathonf/python-3.6 -y

# Update and upgrade:
echo "Update and Upgrade"
sudo apt-get update
sudo apt-get -y upgrade

# Install python3.6:
echo "Installing Python 3.6"
sudo apt-get install -y python3.6

# Install git-core:
echo "Installing Git-core"
sudo apt-get install -y git-core

# Install zsh and ohmyzsh:
echo "Installing zsh and setting up ohmyzsh theme"
sudo apt-get install -y zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# Cleaning:
echo "Cleaning Up !!"
sudo apt-get autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean

# Change default shell:
echo "Changing default shell"
chsh -s $(which zsh)

read -p "Done !! Press enter to reboot"
echo "Rebooting..."
reboot

#END#
