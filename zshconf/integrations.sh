# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/diego/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/diego/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/diego/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/diego/google-cloud-sdk/completion.zsh.inc'; fi

# FZF
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
