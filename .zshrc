# ----------------------------------------
# Path
# ----------------------------------------

# common
DOT_FILES="${HOME}/dotfiles"
export PATH="${PATH}:${DOT_FILES}"

# ----------------------------------------
# history
# ----------------------------------------

HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する

# ----------------------------------------
# completion
# ----------------------------------------

# enable completion
autoload -Uz compinit && compinit

# 補完候補をそのまま探す -> 小文字を大文字に変えて探す -> 大文字を小文字に変えて探す
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''

### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2

# ----------------------------------------
# others
# ----------------------------------------

# automatically change directory when dir name is typed
setopt auto_cd

# disable ctrl+s, ctrl+q
setopt no_flow_control

# ----------------------------------------
# tmux setting
# ----------------------------------------

tmux source "${DOT_FILES}/.tmux.conf"
tmux

# ----------------------------------------
# Command Alias
# ----------------------------------------

# shell script
alias update="sh '${DOT_FILES}/commands/update.sh'"
alias grep="grep --color=auto"

# tmux
alias ide="sh '${DOT_FILES}/commands/ide.sh'"
