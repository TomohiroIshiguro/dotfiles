#!/bin/sh

DOT=dotfiles

# ファイル名
SETTINGS_FILE=settings.json
KEYBINDINGS_FILE=keybindings.json

# ファイルパス
VSCODE_DIR="-"
case $(uname -o | tr '[:upper:]' '[:lower:]') in
  linux*)
    ;;
  darwin*)
    ;;
  msys*)
    VSCODE_DIR="$HOME/AppData/Roaming/Code/User"
    ;;
  *)
    ;;
esac

# 設定ファイル
# --------------------------------
SETTINGS_FULL_PATH="$VSCODE_DIR/$SETTINGS_FILE"
if [ ! -e "$SETTINGS_FULL_PATH" ]; then
    echo "[Info] Generated: $SETTINGS_FILE"
else
    echo "[Alert] The file already exists: $SETTINGS_FILE"
    mv "$SETTINGS_FULL_PATH" "$SETTINGS_FULL_PATH."`date "+%Y%m%d%H%M%S"`bk
fi
ln -s  "$HOME/$DOT/.vscode/$SETTINGS_FILE" "$SETTINGS_FULL_PATH"

# ショートカットキー設定ファイル
# --------------------------------
KEYBINDINGS_FULL_PATH="$VSCODE_DIR/$KEYBINDINGS_FILE"
if [ ! -e "$KEYBINDINGS_FULL_PATH" ]; then
    echo "[Info] Generated: $KEYBINDINGS_FILE"
else
    echo "[Alert] The file already exists: $KEYBINDINGS_FILE"
    mv "$KEYBINDINGS_FULL_PATH" "$KEYBINDINGS_FULL_PATH."`date "+%Y%m%d%H%M%S"`bk
fi
ln -s  "$HOME/$DOT/.vscode/$KEYBINDINGS_FILE" "$KEYBINDINGS_FULL_PATH"

# extension をインストールする
# --------------------------------

cat "$HOME/$DOT/.vscode/extensions" | while read line
do
  code --install-extension $line > /dev/null
done
