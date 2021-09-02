#!/bin/bash

echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade
echo "================================================================


"

echo "Instalando o snap..."
sudo apt install snapd
echo "================================================================


"

echo "Instalando o git..."
sudo apt install git
echo "================================================================


"

echo "Instalando o curl..."
sudo apt install curl
echo "================================================================


"

echo "Instalando o vscode..."
sudo snap install code --classic
echo "================================================================


"

echo "Instalando o beekeeper-studio..."
sudo snap install beekeeper-studio
echo "================================================================


"

echo "Instalando o postman..."
snap install --channel=v7 postman
echo "================================================================


"

echo "Instalando o android-studio..."
sudo snap install android-studio --classic
echo "================================================================


"

echo "Instalando o spotify..."
sudo snap install spotify
echo "================================================================


"

echo "Instalando o nodejs..."   
curl -sL https://deb.nodesource.com/setup_14.x -o setup_14.sh
sudo sh ./setup_14.sh
sudo apt install -y nodejs
echo "================================================================


"

echo "Instalando o yarn..." 
sudo npm install -g yarn
echo "================================================================


"

echo "Instalando o pycharm..." 
sudo snap install pycharm-professional --classic
echo "================================================================


"

echo "Instalando o docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -aG docker $USER
echo "================================================================


"

sudo rm get-docker.sh

sudo rm setup_14.sh

echo "Todos os programas foram instalados"
echo "Reiniciar computador? s/n"
read make_shutdown

if [ "$make_shutdown" -eq "s" ]; then

reboot

else

exit

fi
