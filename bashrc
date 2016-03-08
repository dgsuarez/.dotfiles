# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#Enable completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

source ~/.bashconf/sensible.bash
source ~/.bashconf/termwtf.bash
source ~/.bashconf/defaults.bash
source ~/.bashconf/prompt.bash
source ~/.bashconf/aliases.bash
source ~/.bashconf/ruby.bash

source ~/.capsasesc.sh
