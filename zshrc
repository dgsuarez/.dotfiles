# Completion
autoload -U compinit; compinit

# PROMPT
# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# add ${vcs_info_msg_0} to the prompt
PROMPT='%F{green}%*%f%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f $ '

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/diego/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/diego/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/diego/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/diego/google-cloud-sdk/completion.zsh.inc'; fi

# FZF
# Auto-completion
# ---------------
if [ -f "/opt/homebrew/opt/fzf/shell/completion.zsh" ]; then
  [[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null;
fi
# Key bindings
# ------------
if [ -f "/opt/homebrew/opt/fzf/shell/key-bindings.zsh" ]; then
  source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
fi

# Shared history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=${HISTFILE:-$HOME/.zsh_history}
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space

source ~/.bashconf/defaults.bash
source ~/.bashconf/aliases.bash
source ~/.bashconf/dev_env.bash
source ~/.bashconf/ruby.bash
