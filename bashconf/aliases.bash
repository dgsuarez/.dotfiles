alias n2z="tr '\n' '\0'"
alias reown='sudo chown -R $USER:$USER'
alias serve='python -m SimpleHTTPServer'
alias v=vi

codeshot(){
  min_size=${2:-32}
  style=${3:-trac}
  pygmentize -O full,style="$style",font_size="$min_size",line_numbers=False -f png $1 | xclip -selection clipboard -t image/png
}

killport(){
  sudo lsof -i :"$1" | awk '/LISTEN/ { print $2}' | xargs -r kill
}

muxw(){
  name=`basename "$PWD"`
  tmuxinator s work -n "$name"
}

alias htmlizecode='pygmentize -O full,style=trac -f html'

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
