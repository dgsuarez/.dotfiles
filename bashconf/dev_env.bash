if [ -d "/usr/local/heroku" ]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

if [ -d "$HOME/.arcanist" ]; then
  export PATH="$PATH:$HOME/.arcanist/arcanist/bin"
fi

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi


