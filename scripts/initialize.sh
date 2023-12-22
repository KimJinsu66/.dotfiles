ln -s ~/.dotfiles/zshrc/.zshrc ~

# oh my zshを先にdownloadする必要がある
# https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 開発で必要なライブラリInstall
brew install gh
brew install ripgrep # installしないとvim設定でエラー発生、検索で利用している


# powerlevel10k terminalデザインのため修正
git clone https://github.com/romkatv/powerlevel10k.git $ZSH/themes/powerlevel10k

open "https://kangyb.tistory.com/23" # ちゃんとまとまっている(韓国語)

# zsh-autosuggestions install
# リンク: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
