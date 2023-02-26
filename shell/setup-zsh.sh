#!/bin/bash
set -euo pipefail

DIR=shell
CURDIR="$(pwd)/${DIR}"

echo ${CURDIR}
cd ${CURDIR}

FILE=.zshrc

if [ -e "${HOME}/${FILE}" ]; then
  echo "[Alert] The file already exists: ${FILE}"
    NOW=$(date "+%Y%m%d%H%M%S")
    mv "${HOME}/${FILE}" "${HOME}/${FILE}.${NOW}bk"
    echo "[Info] Rename to ${FILE}.${NOW}bk"
fi
ln -s "${CURDIR}/${FILE}" "${HOME}/${FILE}"
echo "[Info] Generated: ${FILE}"

echo "Done setting up zsh."
