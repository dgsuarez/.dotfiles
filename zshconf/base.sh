unsetopt beep

# Nested shells and tmux panes re-source dev_env.sh, which prepends to PATH again
typeset -U PATH path

##########
# HISTORY
##########

HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# Record timestamp in history:
setopt EXTENDED_HISTORY

# Expire duplicate entries first when trimming history:
setopt HIST_EXPIRE_DUPS_FIRST

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
