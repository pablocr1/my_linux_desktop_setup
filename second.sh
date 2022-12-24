sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "Edite o arquivo .zshrc para alterar o tema e os plugins"
echo "Altere a linha 'ZSH_THEME="robbyrussell"' para 'ZSH_THEME="spaceship"' e 'plugins=(git)' para 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' no arquivo .zshrc"

echo "Instalando o NodeJS..."
nvm install --lts

echo "Instalando o Yarn..."
npm install -g yarn