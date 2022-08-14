# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

source ~/.bashconf/sensible.bash
source ~/.bashconf/completion.bash
source ~/.bashconf/defaults.bash
source ~/.bashconf/prompt.bash
source ~/.bashconf/aliases.bash
source ~/.bashconf/dev_env.bash
source ~/.bashconf/ruby.bash
if [ -f ~/.bash_local.bash ]; then
  source ~/.bash_local.bash
fi

