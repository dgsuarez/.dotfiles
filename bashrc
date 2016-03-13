# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

source ~/.bashconf/sensible.bash
source ~/.bashconf/completion.bash
source ~/.bashconf/termwtf.bash
source ~/.bashconf/defaults.bash
source ~/.bashconf/prompt.bash
source ~/.bashconf/aliases.bash
source ~/.bashconf/ruby.bash

source ~/.capsasesc.sh
