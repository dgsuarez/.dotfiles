# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

source ~/.commonshconf/defaults.sh
source ~/.commonshconf/aliases.sh
source ~/.commonshconf/dev_env.sh

source ~/.bashconf/sensible.bash
source ~/.bashconf/completion.bash
source ~/.bashconf/prompt.bash
if [ -f ~/.bash_local.bash ]; then
  source ~/.bash_local.bash
fi

eval "$(direnv hook bash)"

