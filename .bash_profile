# .bash_profile
set -euo pipefail

# generated by Git for Windows
[ -f ~/.profile ] && . ~/.profile
[ -f ~/.bashrc ] && . ~/.bashrc

# Prompt
export PS1="\[\e[0;35m\]\u@\h\[\e[0m\]:\[\e[0;33m\]\w\[\e[0m\]\n\\$ "

# ----------------------------------------
# Path
# ----------------------------------------

# common
DOT_FILES="${HOME}/dotfiles"
export PATH="${PATH}:${DOT_FILES}"

# ----------------------------------------
# tmux setting
# ----------------------------------------

case $(uname -o | tr '[:upper:]' '[:lower:]') in
linux*)
  break
  ;;
darwin*) # MacOS
  tmux source "${DOT_FILES}/.tmux.conf"
  [ $SHLVL = 1 ] && tmux
  break
  ;;
msys*) # Windows
  tmux source "${DOT_FILES}/.tmux.conf"
  [ $SHLVL = 1 ] && tmux
  break
  ;;
*)
  break
  ;;
esac

# ----------------------------------------
# Command Alias
# ----------------------------------------

# shell script
alias update="sh '${DOT_FILES}/commands/update.sh'"

# tmux
alias ide="sh '${DOT_FILES}/commands/ide.sh'"
