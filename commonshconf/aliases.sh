alias n2z="tr '\n' '\0'"
alias serve='python3 -m http.server'
alias v=nvim
alias o=open
alias yamlgron='yq . -o=json | jq --slurp | gron'

if command -v ggrep >/dev/null 2>&1; then
  alias grp='ggrep'
else
  alias grp='grep'
fi

killport(){
  sudo lsof -i :"$1" | awk '/LISTEN/ { print $2}' | xargs -r kill
}

mux(){
  session_name=`basename "$PWD" | sed 's/\./_/g'`

  echo -ne "\033]0;${session_name}\007"

  if ! tmux has-session -t "=$session_name" 2>/dev/null; then
    tmux new-session -d -s "$session_name" -n nvim
    # send-keys rather than a session command, so quitting nvim leaves the shell open
    tmux send-keys -t "=$session_name:nvim" nvim Enter
    tmux split-window -h -d -t "=$session_name:nvim" -c "$PWD"
  fi

  if [ -n "$TMUX" ]; then
    tmux switch-client -t "=$session_name"
  else
    tmux attach -t "=$session_name"
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
