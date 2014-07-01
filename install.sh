#!/bin/bash
# Part 1 of the install script. Mostly installing some packages.

RUBY_VERSION="2.1.1"

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
  sudo apt-get install -y build-essential cmake g++ make nodejs python python-software-properties software-properties-common vim

  echo -e "Installing various other packages\n"
  sudo apt-get install -y curl terminator tree ubuntu-restricted-extras vlc wget zsh

elif [[ "$(uname)" == "Darwin" ]] ; then

  if ! type brew 2>&1 > /dev/null ; then
    echo -e "Installing Homebrew\n"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi

  echo -e "Updating and upgrading existing Homebrew packages\n"
  brew update
  brew upgrade

  echo -e "Installing Homebrew packages"
  brew install cmake node tree wget

fi

if [[ "$(echo $0)" == "zsh" ]] ; then
  echo -e "Sourcing zshrc\n"
  source ~/.zshrc
else
  if [[ ! -d "~/.oh-my-zsh" ]] ; then
    echo -e "Cloning oh my zsh\n"
    git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  fi
  chsh -s $(which zsh)
fi

echo -e "\nヽ༼ຈل͜ຈ༽ﾉ all done ヽ༼ຈل͜ຈ༽ﾉ"
