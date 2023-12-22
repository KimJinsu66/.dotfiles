ln -s ~/.dotfiles/zshrc/.zshrc ~

# 開発で必要なライブラリInstall
brew install gh

# powerlevel10k terminalデザインのため修正
git clone https://github.com/romkatv/powerlevel10k.git $ZSH/themes/powerlevel10k
