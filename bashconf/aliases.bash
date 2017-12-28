alias n2z="tr '\n' '\0'"
alias reown='sudo chown -R $USER:$USER'
alias serve='python -m SimpleHTTPServer'
alias v=vi

hg(){
  if [[ "$1" == up* ]] && [ -z "$2" ]; then
    echo "$1 a onde mangurrian!"
  else
    /usr/bin/env hg "$@"
  fi
}

codeshot(){
pygmentize -O full -f html $2 |
  wkhtmltoimage -q --minimum-font-size $1 -f png - /dev/stdout |
  convert png:- -trim png:- |
  xclip -selection clipboard -t image/png
}

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
