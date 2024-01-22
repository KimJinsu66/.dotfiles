ln -s ~/.dotfiles/zshrc/.zshrc ~
ln -s ~/.dotfiles/vim/.vimrc ~

# pushする時に聞かれないようにする
git config --global push.default current

# git alias
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# oh my zshを先にdownloadする必要がある
# https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 開発で必要なライブラリInstall
brew install gh
brew install ripgrep # installしないとvim設定でエラー発生、検索で利用している

# powerlevel10k terminalデザインのため修正
git clone https://github.com/romkatv/powerlevel10k.git $ZSH/themes/powerlevel10k

open "https://kangyb.tistory.com/23" # ちゃんとまとまっている(韓国語)
open "https://github.com/junegunn/vim-plug" # vim-plug site

# zsh-autosuggestions install
# リンク: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
gh repo clone KimJinsu66/study ~/Desktop/study
