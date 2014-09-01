#!/bin/bash

mkdir /tmp/installscript && cd /tmp/installscript

wget http://www.carrois.com/wordpress/downloads/fira_3_1/FiraFonts3108.zip
wget http://www.levien.com/type/myfonts/Inconsolata.otf
wget http://downloads.sourceforge.net/project/sourcecodepro.adobe/SourceCodePro_FontsOnly-1.017.zip
wget https://github.com/Lokaltog/powerline-fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf

unzip FiraFonts3108.zip
unzip SourceCodePro_FontsOnly-1.017.zip

if [[ "$(uname)" == "Linux" ]] ; then

  wget http://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
  wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

  mkdir -p /usr/share/fonts/opentype/FiraMono /usr/share/fonts/opentype/Inconsolata /usr/share/fonts/opentype/source-code-pro /usr/share/fonts/opentype/inconsolata-for-powerline /usr/share/fonts/opentype/powerline-symbols
  mv FiraFonts3108/FiraMono3108/OTF/ /usr/share/fonts/opentype/FiraMono/
  mv Inconsolata.otf /usr/share/fonts/opentype/Inconsolata/
  mv SourceCodePro_FontsOnly-1.017/OTF/ /usr/share/fonts/opentype/source-code-pro/
  mv "Inconsolata for Powerline.otf" /usr/share/fonts/opentype/inconsolata-for-powerline
  mv PowerlineSymbols.otf /usr/share/fonts/opentype/powerline-symbols/
  fc-cache -fv

  mkdir -p ~/.config/fontconfig
  if [[ -f ~/.config/fontconfig/conf.d ]] ; then
    pushd ~/.config/fontconfig
    mv conf.d conf.d.old
    popd
  else
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d
  fi

else if [[ "$(uname)" == "Darwin" ]] ; then

  mkdir -p ~/Library/Fonts
  mv FiraFonts3108/FiraMono*/OTF/* ~/Library/Fonts
  mv Inconsolata.otf ~/Library/Fonts
  mv SourceCodePro_FontsOnly-1.017/OTF/* ~/Library/Fonts
  mv "Inconsolata for Powerline.otf" ~/Library/Fonts

fi

cd ~ && rm -rf /tmp/installscript
