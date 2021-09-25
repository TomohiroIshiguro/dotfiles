#!/bin/sh

DOT=dotfiles
cd "$HOME/$DOT"

# ----------------------------------------
# link dotfiles
# ----------------------------------------

# make symbolic links
for file in .??*
do
  # ディレクトリはスキップする
  [ -d "$file" ] && continue
  # 特定のファイルはスキップする
  [ "$file" = ".DS_Store" ] && continue
  [ "$file" = ".gitignore" ] && continue
  [ "$file" = ".gitmodules" ] && continue
  # これ以降。設定ファイルのシンボリックリンクを作る
  if [ ! -e "$HOME/$file" ]; then
    echo "[Info] Generated: $file"
  else
    echo "[Alert] The file already exists: $file"
    mv "$HOME/$file" "$HOME/$file."`date "+%Y%m%d%H%M%S"`bk
  fi
  ln -s "$HOME/$DOT/$file" "$HOME/$file"
done

# ----------------------------------------
# vim settings
# ----------------------------------------

mkdir -p "$HOME/.vim/undo"

# Git submodule
git submodule init
git submodule update

# install Vim plugins
vim +PluginInstall +qall

mkdir -p "$HOME/.vim/colors"
[ ! -e "$HOME/.vim/colors/iceberg.vim" ] && ln -s "$HOME/$DOT/.vim/iceberg.vim/colors/iceberg.vim" "$HOME/.vim/colors/"
[ ! -e "$HOME/.vim/ftdetect" ] && ln -s "$HOME/$DOT/.vim/ftdetect" "$HOME/.vim"
[ ! -e "$HOME/.vim/template" ] && ln -s "$HOME/$DOT/.vim/template" "$HOME/.vim"

# ----------------------------------------
#  set up in each os.
# ----------------------------------------

case $(uname -o | tr '[:upper:]' '[:lower:]') in
  linux*)
    ;;
  darwin*)
    ;;
  msys*)
    ;;
  *)
    ;;
esac
