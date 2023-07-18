
source ~/.dotfiles/commonshconf/defaults.sh
source ~/.dotfiles/commonshconf/aliases.sh
source ~/.dotfiles/commonshconf/dev_env.sh

source ~/.dotfiles/zshconf/base.sh
source ~/.dotfiles/zshconf/prompt.sh
source ~/.dotfiles/zshconf/completion.sh
source ~/.dotfiles/zshconf/integrations.sh

if [ -f ~/.zsh_local.sh ]; then
  source ~/.zsh_local.sh
fi

eval "$(direnv hook zsh)"
