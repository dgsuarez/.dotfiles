alias n2z="tr '\n' '\0'"
alias reown='sudo chown -R $USER:$USER'
alias serve='python3 -m http.server'
alias fserve='python -m pyftpdlib -w'
alias v=nvim
alias o=open
alias yamlgron='yq . -o=json | jq --slurp | gron'

if command -v ggrep >/dev/null 2>&1; then
  alias grp='ggrep'
else
  alias grp='grep'
fi

codeshot(){
  min_size=${2:-32}
  style=${3:-trac}
  pygmentize -O full,style="$style",font_size="$min_size",line_numbers=False -f png $1 | xclip -selection clipboard -t image/png
}

killport(){
  sudo lsof -i :"$1" | awk '/LISTEN/ { print $2}' | xargs -r kill
}

mux(){
  rbenv_version=`hash rbenv 2>/dev/null && rbenv global`
  session_name=`basename "$PWD" | sed 's/\./_/g'`

  echo -ne "\033]0;${session_name}\007"

  if [ -f .tmuxinator.yml ]; then
    RBENV_VERSION="$rbenv_version" tmuxinator local
  else
    RBENV_VERSION="$rbenv_version" tmuxinator s nvim -n "$session_name"
  fi
}

claux(){
  if [ -n "$1" ]; then
    # New worktree from project root
    project=$(basename "$PWD" | sed 's/\./_/g')
    echo -ne "\033]0;${project}@${1}\007"
    claude -w "$1" --tmux=classic
    return
  fi

  # No args: must be inside a worktree
  wt_match=$(echo "$PWD" | grep -o '.*/.claude/worktrees/[^/]*')
  if [ -z "$wt_match" ]; then
    echo "Usage: claux <name> (from project root) or claux (from inside a worktree)" >&2
    return 1
  fi

  name=$(basename "$wt_match")
  project_dir=$(echo "$wt_match" | sed 's|/.claude/worktrees/.*||')
  project=$(basename "$project_dir" | sed 's/\./_/g')
  session="${project}_worktree-${name}"
  echo -ne "\033]0;${project}@${name}\007"

  if tmux has-session -t "$session" 2>/dev/null; then
    tmux attach -t "$session"
  else
    claude -r --tmux=classic
  fi
}

local_tunnel(){
  local_port=${3:-"1$2"}
  autossh -N "$1" -L "$local_port":localhost:"$2"
}

togif() {
  ffmpeg -i "$1" "$1.gif"
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
