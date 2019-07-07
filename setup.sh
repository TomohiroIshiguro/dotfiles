#!/bin/bash

# make symbolic links
DOT_FILES=( .vimrc )

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    rm $HOME/$file.copy_failed
    ln -s $HOME/dotfiles/$file $HOME/$file.copy_failed
    echo "[Alert] The file already exists: $file"
    echo " - Edit $file and remove $file.copy_failed."
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "[Info] Generated: $file"
  fi
done
