# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/diego/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/diego/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/diego/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/diego/google-cloud-sdk/completion.zsh.inc'; fi

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi
