# Completion

COMPLETIONS_DIR="$HOME/.dotfiles/zshconf/completions"

if [[ -d "$COMPLETIONS_DIR" ]]; then
  fpath=("$COMPLETIONS_DIR" $fpath)
fi

autoload -Uz compinit
# Rebuild cache at most once every 24h
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' special-dirs true


