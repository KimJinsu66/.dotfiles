if [ -f "$HOME/.zshrc" ]; then
  echo ".zshrc存在する"
else
  echo "hello else"
  ln -s ~/.dotfiles/zshrc/.zshrc ~
fi

# -----------------------
# 初期ファイル設定
# -----------------------
DOTFILE_PATH="$HOME/.dotfiles/zshrc"
source "$DOTFILE_PATH/.zshrc_fzf"
source "$DOTFILE_PATH/.zshrc_company"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
# ====== ZSH THEME ============
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="nerdfont-complete"
export CLICOLOR=1
export TERM=xterm-256color

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# zshrcのaliasを zshenvに移動
function zshalias()
{
  grep "^alias" ~/.zshrc > ~/.zshenv
}


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# rbenv 設定
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

setopt nomatch

# vim
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'

# postgresql 設定
export PATH=$PATH:/usr/local/Cellar/postgresql@10/10.19_1/bin

# -----------------------
# start product
# -----------------------
alias startf='source ~/Desktop/Jinsu/shell/start_frey.sh'
alias starta='source ~/Desktop/Jinsu/shell/start_agnt.sh'

# -----------------------
# shell
# -----------------------
## tmux
alias ide='bash ~/Desktop/Jinsu/shell/tmux/ide.bash'
alias e='exit'
alias twn='tmux new-window -n'
alias twr='tmux rename-window'


# -----------------------
# rails script
# -----------------------
alias log='~/Desktop/Jinsu/shell/rails/log.sh'
alias tc='~/Desktop/Jinsu/shell/rails/test_context.sh'

# -----------------------
# shell script
# -----------------------
alias dr='~/Desktop/Jinsu/shell/shell/remove_debug_code.sh'
alias tr='bash ~/Desktop/Jinsu/shell/shell/translate.sh'
alias nc='bash ~/Desktop/Jinsu/shell/shell/notion/create_database_record.bash'
alias ch='bash ~/Desktop/Jinsu/shell/shell/check_list.sh'

# -----------------------
# ruby script
# -----------------------
alias pru='ruby ~/Desktop/products/verdandi/.script/pull_request_updater.rb'
alias prs='ruby .script/today_work_pull_requests_printer.rb'

# -----------------------
# open site
# -----------------------
alias oc='open -a google\ chrome'
alias google='open https://www.google.com'
alias d-ja='open https://ja.dict.naver.com/#/main'

alias gagnt='open https://github.com/ga-tech/verdandi/pulls'

# ----------------------------------------
# cd
# ---------------------------------------
alias cdsk='cd ~/Desktop/products/skuld'
alias cdf='cd ~/Desktop/products/frey'
alias cde='cd ~/Desktop/products/eldir'
alias cds='cd ~/Desktop/products/sale_nomad_cloud'
alias cdd='cd ~/Desktop/products/common-db-docker'
alias cda='cd ~/Desktop/products/verdandi'
alias cdi='cd ~/Desktop/products/agnt_rda'
alias cdm='cd ~/Desktop/products/tech_after'
alias cdb='cd ~/Desktop/products/tech_building'
alias cdc='cd ~/Desktop/products/common-db-docker'
alias jshell='cd ~/Desktop/Jinsu/shell'
alias cdsa='cd ~/Desktop/products/supplier-article'
alias va='cd ~/Desktop/vagrant'
alias sni='cd ~/.vim/plugged/vim-snippets/snippets'
alias mm='cd ~/Desktop/Jinsu/memo'

# ----------------------------------------
# git
# ---------------------------------------
# alias gdw='git diff --color-words'
alias gs='git status'
alias gsl='git stash list'
alias gss='git stash save'
alias gm='git merge'
alias gc='git commit'
alias gp='git push origin'
alias gd='git diff | git-split-diffs --color | less -RFX'
alias gpu='git pull origin'
alias gm='git merge'
alias grc='git rebase --con'
alias gpd='git pull origin develop'
alias gsd='source ~/Desktop/Jinsu/shell/git_code_delete.sh'
alias gl='git log --color --graph --abbrev-commit --pretty=format:"%Cred%h %Creset-%C(yellow)%d %Creset%s %Cgreen(%cr)%C(bold blue)<%an>"'
alias go='git checkout'

# ----------------------------------------
# docker
# ---------------------------------------
alias sd='/usr/bin/open /Applications/Docker.app'
alias d='docker'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcb='docker-compose exec web bash'
alias dcewa='docker-compose exec webapp'
alias dcew='docker-compose exec web'
alias db='docker-compose exec web bash'
alias lint='docker-compose exec webapp yarn lint:js --fix; docker-compose exec webapp yarn lint:css --fix'
alias lintf='docker-compose exec webapp yarn lint:js --fix'
alias rubocop='docker-compose exec webapp rubocop'
alias test='docker-compose exec webapp rails test'
alias api='docker-compose exec aglio bash build.sh'

# ----------------------------------------
# aws_sso_ruby
# ---------------------------------------
alias ssof='aws_sso_ruby auth -p ga_frey_dev'
alias ssoe='aws_sso_ruby auth -p ga_eldir_dev'
alias ssoa='aws_sso_ruby auth -p ga_main'

# gh
eval "$(gh completion -s zsh)"
alias web='gh pr view --web'

# ----------------------------------------
# db
# ---------------------------------------
alias fdb=" psql -U postgres -p 5431 -h 0.0.0.0 -d frey_dev"
alias cdb=" psql -U postgres -p 15432 -h 0.0.0.0 -d crm"

# ----------------------------------------
# fzf
# ---------------------------------------
alias f='vim $(fzf --preview "bat  --color=always --style=header,grid --line-range :100 {}")'

# ----------------------------------------
# source
# ---------------------------------------
alias svim='source ~/.vimrc'
alias szsh='source ~/.zshrc'


# ----------------------------------------
# vagrant
# ---------------------------------------
alias vu='vagrant up'
alias vs='vagrant ssh'
alias vr='vagrant reload'

# ----------------------------------------
# gh
# ---------------------------------------

alias ghb='gh browse'
alias gpv='gh pr view'
alias re='gh pr list --search "user-review-requested:@me"'

# ----------------------------------------
# tab name
# ---------------------------------------
alias tn='tab-name'

tab-name() {
  echo "in"
  echo $1
  echo -ne "\e]1;$1\a"
}

# ----------------------------------------
# aws
# ---------------------------------------
alias cluster='aws --profile ga_main --region ap-northeast-1 ssm start-session --target'
alias cwt='~/Desktop/Jinsu/shell/shell/aws/aws_cloud_watch_tail.sh'

# ----------------------------------------
# curl
# ---------------------------------------
alias cur='cd ~/Desktop/products/curls/'
alias cura='cd ~/Desktop/products/curls/agnt'

### End of Zinit's installer chunk
source ~/powerlevel10k/powerlevel10k.zsh-theme

alias v='vim'

