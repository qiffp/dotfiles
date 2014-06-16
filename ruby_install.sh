#!/bin/bash
# Part 2 of the install script. Should have started a new zsh session at this point.

echo -e "Running the Ruby part of the install script for $(uname)...\n"

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

echo -e "\nヽ༼ຈل͜ຈ༽ﾉ all done ヽ༼ຈل͜ຈ༽ﾉ"
