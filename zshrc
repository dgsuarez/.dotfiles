# Completion
autoload -U compinit; compinit

# PROMOT
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

source ~/.bashconf/defaults.bash
source ~/.bashconf/aliases.bash
source ~/.bashconf/dev_env.bash
source ~/.bashconf/ruby.bash


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/diego/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/diego/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/diego/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/diego/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
