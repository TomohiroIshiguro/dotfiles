# .bash_profile

# ----------------------------------------
# Environment variables
# ----------------------------------------

# PATH settings
# --------------------

DOT_FILES="$HOME/dotfiles"
ANDROID_HOME="$HOME/work/SDKs/android"
FLUTTER_HOME="$HOME/work/SDKs/flutter"
DART_HOME="$FLUTTER_HOME/bin/cache/dart-sdk"

export PATH="$PATH:$FLUTTER_HOME/bin:$DART_HOME/bin:$ANDROID_HOME/tools/bin:$DOT_FILES"

# User specific variables
# --------------------
export ANDROID_SDK_ROOT="$ANDROID_HOME"

alias ic="ibmcloud"
alias ide="sh ide.sh"

# ----------------------------------------
# tmux setting
# ----------------------------------------

if [ $SHLVL = 1 ]; then
  tmux source $HOME/dotfiles/.tmux.conf
  tmux
fi
