# Completion

COMPLETIONS_DIR="$HOME/.dotfiles/zshconf/completions"

if [[ -d "$COMPLETIONS_DIR" ]]; then
  fpath=("$COMPLETIONS_DIR" $fpath)
fi

autoload -U compinit; compinit
zstyle ':completion:*' special-dirs true


