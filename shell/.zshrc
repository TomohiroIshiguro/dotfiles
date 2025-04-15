# ============================================================================
# ZSH CONFIGURATION
# ============================================================================

# ----------------------------------------
# Path Configuration
# ----------------------------------------
DOT_FILES="${HOME}/dotfiles"
export GOPATH="${HOME}/go"

# Add directories to PATH and remove duplicates
export PATH="${PATH}:${DOT_FILES}:${GOPATH}/bin"
typeset -U path PATH

# ----------------------------------------
# Tmux Configuration
# ----------------------------------------
tmux source "${HOME}/.tmux.conf"
# Uncomment to auto-start tmux
#tmux

# ----------------------------------------
# Aliases
# ----------------------------------------
alias grep="grep --color=auto"
alias ide="sh '${DOT_FILES}/commands/ide.sh'"

# ----------------------------------------
# History Configuration
# ----------------------------------------
HISTFILE="${HOME}/.zsh-history"
HISTSIZE=100000
SAVEHIST=1000000

# History options
setopt inc_append_history  # Add commands to history as they are entered
setopt share_history       # Share history between sessions

# ----------------------------------------
# Completion Configuration
# ----------------------------------------
autoload -Uz compinit && compinit

# Completion styling and behavior
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2

# ----------------------------------------
# Additional Options
# ----------------------------------------
setopt auto_cd          # Change directory without cd command
setopt no_flow_control  # Disable flow control (Ctrl+S/Ctrl+Q)
