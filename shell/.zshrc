# Path
DOT_FILES="${HOME}/dotfiles"
export PATH="${PATH}:${DOT_FILES}"

# tmux
tmux source "${HOME}/.tmux.conf"
#tmux

# Alias
alias grep="grep --color=auto"
alias ide="sh '${DOT_FILES}/commands/ide.sh'"

# History
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

setopt inc_append_history
setopt share_history

# Completion
autoload -Uz compinit && compinit

zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2

# Others
setopt auto_cd
setopt no_flow_control
