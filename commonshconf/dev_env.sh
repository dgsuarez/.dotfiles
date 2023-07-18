if [ -d "/usr/local/heroku" ]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

if [ -d "$HOME/buildkit" ]; then
  export PATH="$HOME/buildkit/bin:$PATH"
fi

if [ -d "$HOME/.nvm" ]; then
  export NPM_TOKEN= # If this is set using direnv for some folder it won't be there at shell start and nvm will raise an error
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
fi

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/.pyenv" ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

