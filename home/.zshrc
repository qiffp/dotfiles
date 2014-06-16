# Path to oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

CASE_SENSITIVE="false" # Case-sensitive completion
COMPLETION_WAITING_DOTS="true"

# Core plugins - ~/.oh-my-zsh/plugins/*  ||  Custom plugins - ~/.oh-my-zsh/custom/plugins/
plugins=(brew bundler gem gitfast osx rails ruby tmux tmuxinator vagrant zeus zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export EDITOR='vim'
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export TERM=xterm-256color

# prompt
PROMPT='%n %{$fg_bold[red]%}:: %{$fg[green]%}%1~ $(git_prompt_info)%{$reset_color%}» '
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}:: %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}**"

### aliases ###

# paths
if [[ "$(uname)" == "Linux" ]] ; then
  alias subl="/opt/Sublime Text 2/sublime_text"
elif [[ "$(uname)" == "Darwin" ]] ; then
  alias subl="/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
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
alias gls="git_log_search"
alias gu="git pull"
alias gsu="git submodule update --recursive --init"
alias gsi="git submodule init"
alias gus="git pull && git submodule update --recursive --init"
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

### other ###

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
