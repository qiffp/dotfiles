# Path to oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

CASE_SENSITIVE="false" # Case-sensitive completion
COMPLETION_WAITING_DOTS="true"

# Core plugins - ~/.oh-my-zsh/plugins/*  ||  Custom plugins - ~/.oh-my-zsh/custom/plugins/
plugins=(bundler gem gitfast)

source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export EDITOR='vim'
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export TERM=xterm-256color

# go
export GOPATH=~/Code/go
if [[ -d $GOPATH ]]; then
  export PATH=$PATH:$GOPATH/bin
fi

# nvm
# NOTE: if want to use nvm, run commented command
export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

# android
export ANDROID_HOME=/usr/local/opt/android-sdk

# fzf
export FZF_DEFAULT_COMMAND='ag --ignore .git --ignore node_modules --ignore "*.o" --hidden -g ""'

# prompt
PROMPT='%n %{$fg_bold[red]%}:: %{$fg_no_bold[green]%}%1~ $(git_prompt_info)%{$reset_color%}» '
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}:: %{$fg_no_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}**"

### aliases ###

# paths
if [[ "$(uname)" == "Linux" ]] ; then
  alias subl="/opt/Sublime\ Text\ 2/sublime_text"
elif [[ "$(uname)" == "Darwin" ]] ; then
  alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
fi

# navigation
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias uuuuu='cd ../../../../..'

# git
alias gd="git diff"
alias gs="git status"
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --graph"
alias gll="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --numstat"
alias gu="git pull"
alias gsu="git submodule update --recursive --init"
alias gsi="git submodule init"
alias gus="git pull && git submodule update --recursive --init"
alias ga="git add"
alias gaa="git add -A"
alias gci="git commit"
alias gcia="git commit -a"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcot="git checkout -t"
alias gcobt="git checkout -b -t"
alias gcotb="git checkout -b -t"
alias gp="git push"
alias gb="git branch"
alias gbr="git branch -r"
alias gbs="git branch -a | grep -i"
alias gss="git stash save"
alias gsp="git stash pop"
alias gsa="git stash apply"
alias gsl="git stash list"

# rails
alias bx="bundle exec"
alias bxs="bundle exec rails server"
alias bxc="bundle exec rails console"
alias bxcs="bundle exec rails console --sandbox"
alias bxr="bundle exec rake"

# poverty
alias ksdiff="open"

### other ###
if [[ "$(uname)" == "Linux" ]] ; then
  alias open="xdg-open"
fi
alias vim="nvim"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
