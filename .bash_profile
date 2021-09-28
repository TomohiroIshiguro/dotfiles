# .bash_profile

# generated by Git for Windows
test -f ~/.profile && . ~/.profile
test -f ~/.bashrc && . ~/.bashrc

# Prompt
export PS1="\[\e[0;35m\][\h] \$MSYSTEM\[\e[0m\] \[\e[0;33m\]\w\[\e[0m\]\n\\$ "

# ----------------------------------------
# Path
# ----------------------------------------

# For Flutter
JAVA_HOME="$HOME/work/SDKs/java/jdk-16.0.2"

ANDROID_HOME="$HOME/AppData/Local/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

FLUTTER_HOME="$HOME/work/SDKs/flutter"
DART_HOME="$FLUTTER_HOME/bin/cache/dart-sdk"

# common
DOT_FILES="$HOME/dotfiles"
export PATH="$PATH:$FLUTTER_HOME/bin:$DART_HOME/bin:$ANDROID_HOME/tools/bin:$JAVA_HOME/bin:$DOT_FILES"

# ----------------------------------------
# tmux setting
# ----------------------------------------

case $(uname -o | tr '[:upper:]' '[:lower:]') in
  linux*)
    ;;
  darwin*) # MacOS
    tmux source "$DOT_FILES/.tmux.conf"
    if [ $SHLVL = 1 ]; then
      tmux
    fi
    ;;
  msys*) # Windows
    tmux source "$DOT_FILES/.tmux.conf"
    if [ $SHLVL = 1 ]; then
      tmux
    fi
    ;;
  *)
    ;;
esac

# ----------------------------------------
# Command Alias
# ----------------------------------------

# shell script
alias update="sh '$DOT_FILES/commands/update.sh'"
alias update-repo="sh '$DOT_FILES/commands/update.sh'"
alias update_repo="sh '$DOT_FILES/commands/update.sh'"

# tmux
alias ide="sh '$DOT_FILES/commands/ide.sh'"
