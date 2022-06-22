#!/bin/bash
#set -euo pipefail
set -uo pipefail

DIR_ROOT="$(pwd)"

for dir in *; do
  # フォルダ以外はスキップする
  [ ! -d "${DIR_ROOT}/${dir}" ] && continue
  # フォルダ内に .git フォルダが無ければスキップする
  [ ! -e "${DIR_ROOT}/${dir}/.git" ] && continue
  # ディレクトリなら、その中の資料・コードを最新化する
  echo ----------------------------------------
  echo "${dir}"
  echo ----------------------------------------
  cd "${DIR_ROOT}/${dir}"
  git pull
  # git submodules を使っているリポジトリの場合は、サブモジュールも更新する
  if [ -e "${DIR_ROOT}/${dir}/.gitmodules" ]; then
    echo "This repository has sub modules."
    git submodule init
    git submodule update
  fi
  git branch
done
