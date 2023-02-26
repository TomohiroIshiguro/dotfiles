#!/bin/bash
set -euo pipefail

DIR=vim
CURDIR="$(pwd)/${DIR}"

echo ${CURDIR}
cd ${CURDIR}

# vim undo history settings
mkdir -p "${HOME}/.vim/undo"

# make symbolic links
for file in .??*; do
  # ディレクトリはスキップする
  [ -d "${file}" ] && continue
  # 特定のファイルはスキップする
  [ "${file}" = ".DS_Store" ] && continue
  [ "${file}" = ".gitmodules" ] && continue
  # これ以降。設定ファイルのシンボリックリンクを作る
  if [ -e "${HOME}/${file}" ]; then
    echo "[Alert] The file already exists: ${file}"
    NOW=$(date "+%Y%m%d%H%M%S")
    mv "${HOME}/${file}" "${HOME}/${file}.${NOW}bk"
    echo "[Info] Rename to ${file}.${NOW}bk"
  fi
  ln -s "${CURDIR}/${file}" "${HOME}/${file}"
  echo "[Info] Generated: ${file}"
done

[ ! -e "${HOME}/.vim/config" ] && \
  ln -s "${CURDIR}/config" "${HOME}/.vim"

# Git submodule
git submodule init
git submodule update

# install Vim plugins
vim +PluginInstall +qall

# link vim color theme
mkdir -p "${HOME}/.vim/colors"
[ ! -e "${HOME}/.vim/colors/iceberg.vim" ] && \
  ln -s "$(pwd)/.vim/iceberg.vim/colors/iceberg.vim" "${HOME}/.vim/colors/"

echo "Done setting up vim."
