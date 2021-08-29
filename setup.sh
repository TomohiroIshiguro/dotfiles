#!/bin/bash

DOT=dotfiles

# vim settings
mkdir -p "$HOME/.vim/undo"

# make symbolic links
for file in .??*
do
  if [ -d "$file" ]; then
    continue
  fi
  [[ "$file" == ".DS_Store" ]] && continue
  [[ "$file" == ".gitignore" ]] && continue
  [[ "$file" == ".gitmodules" ]] && continue
  if [ ! -e "$HOME/$DOT/$file" ]; then
    continue
  fi
  if [ ! -e "$HOME/$file" ]; then
    echo "[Info] Generated: $file"
  else
    echo "[Alert] The file already exists: $file"
    mv "$HOME/$file" "$HOME/$file."`date "+%Y%m%d%H%M%S"`bk
  fi
  ln -s "$HOME/$DOT/$file" "$HOME/$file"
done

# Git submodule
git submodule init
git submodule update

# install Vim plugins
vim +PluginInstall +qall

# copy files
mkdir -p "$HOME/.vim/colors"
ln -s "$HOME/$DOT/.vim/iceberg.vim/colors/iceberg.vim" "$HOME/.vim/colors/"
ln -s "$HOME/$DOT/.vim/ftdetect" "$HOME/.vim"
