#!/bin/bash

# make symbolic links
for file in .??*
do
  if [ -d "$file" ]; then
    continue
  fi
  [[ "$file" == ".DS_Store" ]] && continue
  [[ "$file" == ".gitignore" ]] && continue
  [[ "$file" == ".gitmodules" ]] && continue
  if [ ! -e "$HOME/dotfiles/$file" ]; then
    continue
  fi
  if [ -e "$HOME/$file" ]; then
    echo "[Alert] The file already exists: $file"
    mv "$HOME/$file" "$HOME/$file."`date "+%Y%m%d%H%M%S"`bk
  else
    echo "[Info] Generated: $file"
  fi
  ln -s "$HOME/dotfiles/$file" "$HOME/$file"
done

# Git submodule
git submodule init
git submodule update

# install Vim plugins
vim +PluginInstall +qall

# copy .vim/ftdetect
mkdir -p "$HOME/.vim/ftdetect/"
cp "$HOME/dotfiles/.vim/ftdetect/*" "$HOME/.vim/ftdetect/"

