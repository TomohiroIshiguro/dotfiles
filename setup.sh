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

# Git submodule
git submodule add -f https://github.com/VundleVim/Vundle.vim.git .vim/Vundle.vim

# install Vim plugins
vim +PluginInstall +qall

# copy .vim/ftdetect
mkdir -p ~/.vim/ftdetect/
cp ~/dotfiles/.vim/ftdetect/* ~/.vim/ftdetect/
