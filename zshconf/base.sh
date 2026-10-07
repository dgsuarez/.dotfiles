unsetopt beep
setopt INTERACTIVE_COMMENTS

setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT

# Nested shells and tmux panes re-source dev_env.sh, which prepends to PATH again
typeset -U PATH path

##########
# HISTORY
##########

# Off the default path: shells that skip this file fall back to /etc/zshrc's SAVEHIST=1000
# and would truncate a shared ~/.zsh_history
HISTFILE=${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history
[[ -d ${HISTFILE:h} ]] || mkdir -p ${HISTFILE:h}
HISTSIZE=50000
SAVEHIST=50000

# Record timestamp in history:
setopt EXTENDED_HISTORY

# Delete old recorded entry if new entry is a duplicate:
setopt HIST_IGNORE_ALL_DUPS

# Do not display a line previously found:
setopt HIST_FIND_NO_DUPS

# Dont record an entry starting with a space:
setopt HIST_IGNORE_SPACE

# Dont write duplicate entries in the history file:
setopt HIST_SAVE_NO_DUPS

# Share history between all sessions:
setopt SHARE_HISTORY

# Show !! / !$ expansions for review instead of running them
setopt HIST_VERIFY

setopt HIST_REDUCE_BLANKS

##########
# LINE EDITOR
##########

autoload -Uz edit-command-line up-line-or-beginning-search down-line-or-beginning-search
zle -N edit-command-line
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^X^E' edit-command-line
# Normal and application cursor modes send different sequences for the arrows
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search
