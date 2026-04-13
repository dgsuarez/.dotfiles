if [ -d "$HOME/buildkit" ]; then
  export PATH="$HOME/buildkit/bin:$PATH"
fi

if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd)"
fi

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

DOTFILES_BIN="$HOME/.dotfiles/bin"
if [ -d "$DOTFILES_BIN" ]; then
  export PATH="$DOTFILES_BIN:$PATH"
fi

