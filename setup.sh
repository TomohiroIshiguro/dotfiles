#!/bin/bash

# make symbolic links
for file in .??*
do
  if [ -d $file ]; then
    continue
  fi
  [[ "$file" == ".DS_Store" ]] && continue
  [[ "$file" == ".gitignore" ]] && continue
  [[ "$file" == ".gitmodules" ]] && continue
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

# Git submodule
git submodule add -f https://github.com/VundleVim/Vundle.vim.git .vim/Vundle.vim

# install Vim plugins
vim +PluginInstall +qall

# copy .vim/ftdetect
mkdir -p $HOME/.vim/ftdetect/
cp $HOME/dotfiles/.vim/ftdetect/* $HOME/.vim/ftdetect/