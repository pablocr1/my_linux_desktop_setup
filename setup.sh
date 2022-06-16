#!/bin/bash

echo "Atenção: Este script irá instalar e configurar vários programas."
echo  "Recomendo que edite o script antes de executar e remova os programas que não deseja."
echo "Alguns processos podem exigir a intervenção para continuar."
echo "Fique atento ao que aparece na tela."
read -p "Pressione <ENTER> para continuar." pass

echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

echo "Instalando algumas dependências..."
sudo apt install software-properties-common apt-transport-https wget curl -y
sudo apt install openjdk-8-jdk openjdk-11-jdk -y

echo "Instalando o python 3..."
sudo apt-get install python3 python3-venv python3-pip -y

echo "Instalando o Chrome..."
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt install ./google-chrome-stable_current_amd64.deb -y
rm google-chrome-stable_current_amd64.deb

echo "Instalando o Visual Studio Code..."
sudo add-apt-repository “deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main”
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable

echo "Instalando o Beekeeper..."
wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add -
echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list
sudo apt update
sudo apt install beekeeper-studio

echo "Baixando o JetBrains Toolbox (instalador do Pycharm e Android Studio)..."
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.24.12080.tar.gz\?_gl\=1\*11v8mpp\*_ga\*NTQ5NTIxOTgzLjE2NTQxMjEwNDk.\*_ga_9J976DJZ68\*MTY1NDI1NTEyOC4yLjEuMTY1NDI1NTE1NS4w\&_ga\=2.82006932.32517002.1654255129-549521983.1654121049
echo "Extraia o arquivo do JetBrains Toolbox e execute o appimage"
read -p "Pressione enter para continuar" pass

echo "Instalando o git..."
sudo apt install git -y

echo "Instalando o postman..."
snap install --channel=v7 postman

echo "Instalando o spotify..."
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y

echo "Instalando o nodejs..."   
curl -sL https://deb.nodesource.com/setup_14.x -o setup_14.sh
sudo sh ./setup_14.sh
sudo apt install -y nodejs

echo "Instalando o yarn..." 
sudo npm install -g yarn

echo "Instalando o docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

echo "Instalando o docker compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -aG docker $USER

sudo rm get-docker.sh

sudo rm setup_14.sh

# echo "Salvando as váriaveis de ambiente para o BASH..."
# echo "alias dc=\"docker-compose\"" >> .bashrc
# echo "export ANDROID_HOME=$HOME/Android" >> .bashrc
# echo "export ANDROID_HOME=$HOME/Android/Sdk" >> .bashrc
# echo "export PATH=$PATH:$ANDROID_HOME/tools" >> .bashrc
# echo "export ANDROID_SDK_ROOT=$HOME/Android/Sdk" >> .bashrc
# echo "export PATH=$PATH:$ANDROID_HOME/emulator" >> .bashrc
# echo "export ANDROID_AVD_HOME=.android/avd" >> .bashrc
# echo "export PATH=$PATH:$HOME/bin:$ANDROID_SDK_ROOT/tools" >> .bashrc
# echo "export PATH=${PATH}:${ANDROID_SDK_ROOT}/tools" >> .bashrc
# echo "export PATH=$PATH:$ANDROID_HOME/tools/bin" >> .bashrc
# echo "export PATH=${PATH}:${ANDROID_SDK_ROOT}/platform-tools" >> .bashrc

# Os comandos a seguir devem ser executados na pasta HOME do usuário
cd $HOME

# mkdir .icons

# echo "Instalando o tema Dracula para o sistema..."
# wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
# unzip Dracula.zip
# mv Dracula ~/.icons/
# gsettings set org.gnome.desktop.interface icon-theme "Dracula"

echo "Gerando chave SSH para o git..."
read -p "Digite seu email utilizado no Github: " email
ssh-keygen -t ed25519 -C "$email"
echo "A chave SSH se encontra em ~/.ssh/id_ed25519.pub"
echo "Copie e cole no campo 'SSH and GPC Keys' nas configurações do github"
read -p "Pressione enter para continuar" pass

echo "Personalizando o sistema..."

echo "Instalando o tema de icones Papirus..."
sudo add-apt-repository ppa:papirus/papirus
sudo apt install papirus-icon-theme -y

echo "Instalando o shell ZSH..."
sudo apt install zsh -y
chsh -s /bin/zsh
zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "Edite o arquivo .zshrc para alterar o tema e os plugins"
echo "Altere a linha 'ZSH_THEME="robbyrussell"' para 'ZSH_THEME="spaceship"' e 'plugins=(git)' para 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' no arquivo .zshrc"

echo "Salvando as váriaveis de ambiente para o ZSH..."
echo "alias dc=\"docker-compose\"" >> .zshrc
echo "export ANDROID_HOME=$HOME/Android" >> .zshrc
echo "export ANDROID_HOME=$HOME/Android/Sdk" >> .zshrc
echo "export PATH=$PATH:$ANDROID_HOME/tools" >> .zshrc
echo "export ANDROID_SDK_ROOT=$HOME/Android/Sdk" >> .zshrc
echo "export PATH=$PATH:$ANDROID_HOME/emulator" >> .zshrc
echo "export ANDROID_AVD_HOME=.android/avd" >> .zshrc
echo "export PATH=$PATH:$HOME/bin:$ANDROID_SDK_ROOT/tools" >> .zshrc
echo "export PATH=${PATH}:${ANDROID_SDK_ROOT}/tools" >> .zshrc
echo "export PATH=$PATH:$ANDROID_HOME/tools/bin" >> .zshrc
echo "export PATH=${PATH}:${ANDROID_SDK_ROOT}/platform-tools" >> .zshrc

echo "Instalando o tema Dracula para o terminal..."
sudo apt-get install dconf-cli -y
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh

echo "Instalando a fonte Ubuntu Mono For Powerline..."
mkdir -p ~/.fonts
git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git ~/.fonts/ubuntu-mono-powerline-ttf
fc-cache -vf

echo "Todos os programas foram instalados"
echo "Por favor, reinicie o computador"