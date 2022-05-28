#!/bin/bash

echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade
clear

echo "Instalando o git..."
sudo apt install git
clear

echo "Instalando o curl..."
sudo apt install curl
clear

echo "Instalando o postman..."
snap install --channel=v7 postman
clear

echo "Instalando o nodejs..."   
curl -sL https://deb.nodesource.com/setup_14.x -o setup_14.sh
sudo sh ./setup_14.sh
sudo apt install -y nodejs
clear

echo "Instalando o yarn..." 
sudo npm install -g yarn
clear

echo "Instalando o docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

echo "Instalando o docker compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -aG docker $USER
clear

echo "Instalando o spotify..."
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
clear

sudo rm get-docker.sh

sudo rm setup_14.sh

echo "Gerando token ssh para o git..."
ssh-keygen -t ed25519 -C "pablocarvalho.dev@gmail.com"

echo "Todos os programas foram instalados"
echo "Por favor, reinicie o computador"