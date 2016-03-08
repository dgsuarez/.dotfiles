
if [[ "$COLORTERM" -eq "xfce4-terminal" ]]; then
  export TERM=xterm-256color
elif [[ -n "$DISPLAY" ]] && [[ $(hash xprop &> /dev/null && xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2 | xargs xprop -id | grep -qi guake) ]]; then
  # Pretty sure we are in guake...
  export TERM=xterm-256color
fi

