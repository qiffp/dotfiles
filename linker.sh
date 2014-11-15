#!/bin/bash
# Links everything in home/ to ~/, does sanity checks.
# By Simon Eskildsen (github.com/Sirupsen)

home_dir="home"
home_dir_len=${#home_dir}

if [[ "$(uname)" == "Linux" ]]; then
  md5="md5sum"
else
  md5="md5"
fi

function symlink {
  ln -nsf $1 $2
}

function recursive_symlink {
  for file in $1/*; do
    path="$(pwd)/$file"
    base=$(basename $file)
    target="$HOME/$(awk -v path=$file -v len=$home_dir_len 'BEGIN{ print substr(path, len+2); }')"

    if [[ -d $path ]]; then
      mkdir -p $target
      recursive_symlink $file
    else
      if [[ -h $target && ($(readlink $target) == $path)]]; then
        echo -e "$target is symlinked to your dotfiles."
      elif [[ -f $target && $($md5 $path) == $($md5 $target) ]]; then
        echo -e "$target exists and was identical to your dotfile.  Overriding with symlink."
        #symlink $path $target
      elif [[ -a $target ]]; then
        read -p "$target exists and differs from your dotfile. Override?  [yn]" -n 1

        if [[ $REPLY =~ [yY]* ]]; then
          symlink $path $target
        fi
      else
        echo -e "$target does not exist. Symlinking to dotfile."
        symlink $path $target
      fi
    fi
  done
}

shopt -s dotglob
recursive_symlink $home_dir
shopt -u dotglob
