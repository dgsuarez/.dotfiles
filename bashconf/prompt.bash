git_prompt(){
  hash __git_ps1 &>/dev/null && GIT_PS1_SHOWDIRTYSTATE='y' GIT_PS1_SHOWUNTRACKEDFILES='y'  __git_ps1 ' (git %s) '
}

ps1_chcolor(){
  let "color=$1 % $(tput colors)"
  echo '\[$(tput setaf '$color % ')\]'
}

ps1_resetcolor(){
  echo '\[$(tput sgr0)\]'
}

PS1=''
PS1=$PS1$(ps1_chcolor 13)'$(date +"%T") '$(ps1_resetcolor)
PS1=$PS1'\u@\h:\w'
PS1=$PS1$(ps1_chcolor 3)'$(git_prompt)'$(ps1_resetcolor)
PS1=$PS1'\$ '
