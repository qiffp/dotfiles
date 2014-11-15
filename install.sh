#!/bin/bash
# Part 1 of the install script. Mostly installing some packages.

echo -e "ᕙ༼ຈل͜ຈ༽ᕗ Running $(uname) install script ᕙ༼ຈل͜ຈ༽ᕗ\n"

echo -e "Symlinking dotfiles from /home to ~/ ...\n"
source ./linker.sh

if ! type git 2>&1 > /dev/null ; then
  echo -e "\n(ノಠ益ಠ)ノ彡┻━┻ set up git"
  exit 1
fi

echo -e "Some light git configuration\n"
git config --global user.name "Sam Dye"
git config --global user.email "sam.re.dye@gmail.com"
git config --global color.ui true
git config --global push.default simple

if [[ "$(uname)" == "Linux" ]] ; then

  echo -e "Updating / upgrading existing apt-get packages\n"
  sudo apt-get update
  sudo apt-get upgrade

  echo -e "Installing some dev packages\n"
  sudo apt-add-repository -y ppa:chris-lea/node.js
  sudo apt-get install -y build-essential cmake g++ golang libssl-dev liblua5.2-dev lua5.2 luajit make nodejs python python-software-properties software-properties-common

  echo -e "Removing old copies of vim and installing vim-gnome\n"
  sudo apt-get remove -y vim vim-runtime gvim vim-tiny vim-common vim-gui-common
  sudo apt-get install -y vim-gnome

  echo -e "Installing various other packages\n"
  sudo apt-get install -y curl i3 i3status keepassx silversearcher-ag terminator tmux tree ubuntu-restricted-extras vlc wget zsh

elif [[ "$(uname)" == "Darwin" ]] ; then

  if ! type brew 2>&1 > /dev/null ; then
    echo -e "Installing Homebrew\n"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi

  echo -e "Updating and upgrading existing Homebrew packages\n"
  brew update
  brew upgrade

  echo -e "Installing Homebrew packages"
  brew install cmake go node python3 the_silver_searcher tree wget
  brew install macvim --with-lua # prevent bug where 'brew install vim --with-lua' doesn't install lua properly
  brew install vim --override-system-vim --with-lua --with-python3

fi

echo "Installing Vundle"
mkdir -p ~/.vim/bundle/
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Prevent 'Cannot find color scheme solarized' error before running +PluginInstall"
mkdir -p ~/.vim/colors/
curl -o ~/.vim/colors/solarized.vim https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim

echo "Installing vim packages with Vundle"
vim +PluginInstall +qall!

echo "Now remove unnecessary 'vim/colors' directory"
rm -rf ~/.vim/colors/

if [[ "$(echo $0)" == "zsh" ]] ; then
  echo -e "Sourcing zshrc\n"
  source ~/.zshrc
else
  if [[ ! -d "~/.oh-my-zsh" ]] ; then
    echo -e "Cloning oh my zsh\n"
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  fi
  chsh -s $(which zsh)
fi

echo -e "\nヽ༼ຈل͜ຈ༽ﾉ all done ヽ༼ຈل͜ຈ༽ﾉ"
