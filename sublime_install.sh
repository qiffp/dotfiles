#!/bin/bash

mkdir /tmp/installscript && cd /tmp/installscript

if [[ "$(uname)" == "Linux" ]] ; then

  # Download Sublime
  wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.tar.bz2
  tar -vxjf "Sublime Text 2.0.2.tar.bz2"
  mv "Sublime Text 2" /opt/

  # Sublime preferences
  ln -nsf sublime/Preferences.sublime-settings "~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings"
  ln -nsf sublime/Default\ (OSX).sublime-keymap "~/.config/sublime-text-2/Packages/User/Default (Linux).sublime-keymap"
  ln -nsf sublime/trailing_spaces.sublime-settings "~/.config/sublime-text-2/Packages/User/trailing_spaces.sublime-settings"

else if [[ "$(uname)" == "Darwin" ]] ; then

  # Download Sublime
  wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg
  hdiutil mount "Sublime Text 2.0.2.dmg"
  cp -r "/Volumes/Sublime Text 2/Sublime Text 2.app" /Applications/
  hdiutil unmount "/Volumes/Sublime Text 2/"

  # Sublime preferences
  ln -nsf sublime/Preferences.sublime-settings "~/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings"
  ln -nsf sublime/Default\ (OSX).sublime-keymap "~/Library/Application Support/Sublime Text 2/Packages/User/Default (OSX).sublime-keymap"
  ln -nsf sublime/trailing_spaces.sublime-settings "~/Library/Application Support/Sublime Text 2/Packages/User/trailing_spaces.sublime-settings"

fi

cd ~ && rm -rf /tmp/installscript

