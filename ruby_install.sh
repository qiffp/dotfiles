#!/bin/bash
# Part 2 of the install script. Should have started a new zsh session at this point.

RUBY_VERSION="2.1.1"

echo -e "Running the Ruby part of the install script for $(uname)...\n"

if [[ $(uname) == "Linux" ]]; then
  if [[ ! -d "~/.rbenv" ]] ; then
    echo -e "Cloning rbenv\n"
    git clone git@github.com:sstephenson/rbenv.git ~/.rbenv
  else
    echo -e "Not cloning rbenv - directory already exists.\n"
  fi

  if [[ ! -d "~/.rbenv/plugins/ruby-build" ]] ; then
    echo -e "Cloning ruby-build\n"
    git clone git@github.com:sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  else
    echo -e "Not cloning ruby-build - directory already exists.\n"
  fi
elif [[ $(uname) == "Darwin" ]]; then
  brew install rbenv ruby-build
fi

if [[ "$(rbenv global)" != "$RUBY_VERSION" ]] ; then
  echo -e "Installing Ruby $RUBY_VERSION\n"
  rbenv install $RUBY_VERSION
  rbenv rehash
  rbenv global $RUBY_VERSION
fi

echo -e "Updating gems\n"
gem update --system
gem update

echo -e "Installing some gems\n"
gem install bundler rake rdoc rails
rbenv rehash

source ~/.zshrc

echo -e "\nヽ༼ຈل͜ຈ༽ﾉ all done ヽ༼ຈل͜ຈ༽ﾉ"
