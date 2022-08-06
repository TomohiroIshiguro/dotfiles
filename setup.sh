#!/bin/bash
set -euo pipefail

DOT=dotfiles
cd "${HOME}/${DOT}"

# ----------------------------------------
# link dotfiles
# ----------------------------------------

# make symbolic links
for file in .??*; do
  # ディレクトリはスキップする
  [ -d "${file}" ] && continue
  # 特定のファイルはスキップする
  [ "${file}" = ".DS_Store" ] && continue
  [ "${file}" = ".gitignore" ] && continue
  [ "${file}" = ".gitmodules" ] && continue
  # これ以降。設定ファイルのシンボリックリンクを作る
  if [ ! -e "${HOME}/${file}" ]; then
    echo "[Info] Generated: ${file}"
  else
    echo "[Alert] The file already exists: ${file}"
    mv "${HOME}/${file}" "${HOME}/${file}."$(date "+%Y%m%d%H%M%S")bk
  fi
  ln -s "${HOME}/${DOT}/${file}" "${HOME}/${file}"
done

# ----------------------------------------
# vim settings
# ----------------------------------------

mkdir -p "${HOME}/.vim/undo"

git config --global core.pager "LESSCHARSET=utf-8 less"
git config --global core.quotepath false

# Git submodule
git submodule init
git submodule update

# install Vim plugins
vim +PluginInstall +qall

mkdir -p "${HOME}/.vim/colors"
[ ! -e "${HOME}/.vim/colors/iceberg.vim" ] && ln -s -r "${HOME}/${DOT}/.vim/iceberg.vim/colors/iceberg.vim" "${HOME}/.vim/colors/"

# ----------------------------------------
#  set up in each os.
# ----------------------------------------

case $(uname -o | tr '[:upper:]' '[:lower:]') in
linux*) ;;
  # Linux

darwin*) ;;
  # MacOSX

msys*)
  # Windows
  bash ./.vscode/links.sh
  ;;

*) ;;
  # Others

esac
