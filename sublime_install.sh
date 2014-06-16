#!/bin/bash

# Download some fonts - Fira, Inconsolata, Source Code Pro
mkdir ~/fonts && cd ~/fonts
wget http://www.carrois.com/wordpress/downloads/fira_3_1/FiraFonts3108.zip
wget http://www.levien.com/type/myfonts/Inconsolata.otf
wget http://downloads.sourceforge.net/project/sourcecodepro.adobe/SourceCodePro_FontsOnly-1.017.zip

unzip FiraFonts3108.zip
unzip SourceCodePro_FontsOnly-1.017.zip

if [[ "$(uname)" == "Linux" ]] ; then

  # Fonts setup
  mkdir -p /usr/share/fonts/opentype/FiraMono /usr/share/fonts/opentype/Inconsolata /usr/share/fonts/opentype/source-code-pro
  cp -r FiraFonts3108/FiraMono3108/OTF/ /usr/share/fonts/opentype/FiraMono/
  cp Inconsolata.otf /usr/share/fonts/opentype/Inconsolata/
  cp -r SourceCodePro_FontsOnly-1.017/OTF/ /usr/share/fonts/opentype/source-code-pro/
  fc-cache -fv

  # Download Sublime
  cd ~
  wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.tar.bz2
  tar -vxjf "Sublime Text 2.0.2.tar.bz2"
  mv "Sublime Text 2" /opt/
  rm "Sublime Text 2.0.2.tar.bz2"

  # Sublime preferences
  ln -nsf sublime/Preferences.sublime-settings "~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings"
  ln -nsf sublime/Default\ (OSX).sublime-keymap "~/.config/sublime-text-2/Packages/User/Default (Linux).sublime-keymap"
  ln -nsf sublime/trailing_spaces.sublime-settings "~/.config/sublime-text-2/Packages/User/trailing_spaces.sublime-settings"

else if [[ "$(uname)" == "Darwin" ]] ; then

  # Fonts setup
  mkdir -p ~/Library/Fonts
  cp FiraFonts3108/FiraMono*/OTF/* ~/Library/Fonts
  cp Inconsolata.otf ~/Library/Fonts
  cp SourceCodePro_FontsOnly-1.017/OTF/* ~/Library/Fonts

  # Download Sublime
  cd ~
  wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg
  hdiutil mount "Sublime Text 2.0.2.dmg"
  cp -r "/Volumes/Sublime Text 2/Sublime Text 2.app" /Applications/
  hdiutil unmount "/Volumes/Sublime Text 2/"
  rm -f "Sublime Text 2.0.0.dmg"

  # Sublime preferences
  ln -nsf sublime/Preferences.sublime-settings "~/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings"
  ln -nsf sublime/Default\ (OSX).sublime-keymap "~/Library/Application Support/Sublime Text 2/Packages/User/Default (OSX).sublime-keymap"
  ln -nsf sublime/trailing_spaces.sublime-settings "~/Library/Application Support/Sublime Text 2/Packages/User/trailing_spaces.sublime-settings"

fi

cd ~ && rm -rf ~/fonts

