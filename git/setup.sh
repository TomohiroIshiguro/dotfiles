#!/bin/bash
set -euo pipefail

DIR=git
CURDIR="${1}/${DIR}"

echo ${CURDIR}
cd ${CURDIR}

# make symbolic links
for file in .??*; do
  # ディレクトリはスキップする
  [ -d "${file}" ] && continue
  # 特定のファイルはスキップする
  [ "${file}" = ".DS_Store" ] && continue
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

echo "Done setting up git."
