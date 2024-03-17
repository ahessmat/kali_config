#!/bin/bash

echo "-------------------------------------------------------------------"
echo "----- Updating and upgrading package managers ------"
echo "-------------------------------------------------------------------"

sudo apt-get update
sudo apt-get upgrade -y

echo "-------------------------------------------------------------------"
echo "----- Updating wordlists for use ------"
echo "-------------------------------------------------------------------"

cd /usr/share/wordlists
git clone https://github.com/danielmiessler/SecLists.git
gunzip rockyou.txt.gz
cd ~

echo "-------------------------------------------------------------------"
echo "----- Installing VS Code ------"
echo "-------------------------------------------------------------------"

wget -O code-latest.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install ./code-latest.deb
rm code-latest.deb

echo "-------------------------------------------------------------------"
echo "----- Installing Node.js ------"
echo "-------------------------------------------------------------------"


# https://deb.nodesource.com/
# Installs Node.js follow the link above to ensure version is current
# This will also add the repository to the package manager

sudo apt-get update && sudo apt-get install -y ca-certificates curl gnupg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update && sudo apt-get install nodejs -y

echo "-------------------------------------------------------------------"
echo "----- Don't forget to install Burpsuite Pro! ------"
echo "-------------------------------------------------------------------"