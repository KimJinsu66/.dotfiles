ln -s ~/.dotfiles/zshrc/.zshrc ~
ln -s ~/.dotfiles/vim/.vimrc ~
ln -s ~/.dotfiles/nvim ~/.config/nvim

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
brew install git-delta # git diff viewer https://github.com/dandavison/delta

# powerlevel10k terminalデザインのため修正
git clone https://github.com/romkatv/powerlevel10k.git $ZSH/themes/powerlevel10k

open "https://kangyb.tistory.com/23" # ちゃんとまとまっている(韓国語)
open "https://github.com/junegunn/vim-plug" # vim-plug site

# zsh-autosuggestions install
# リンク: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
gh repo clone KimJinsu66/study ~/Desktop/study

echo '=== vim ale pluginの説明 ==='
echo 'aleはdocker環境の対応を行なっていない、かつdocker-composeを上手くしても起動しないため手動でファイル作成が必要です'
echo '自分が利用しているプロダクトにrubocopファイルを作成し、scrips/rubocopのファイルをコピしてください'
