hg_prompt(){
  hash hg &> /dev/null && /usr/bin/env hg log -r . --template ' (hg {branch}:{bookmarks}) ' 2> /dev/null | sed 's/\:)/)/'
}    

git_prompt(){
  GIT_PS1_SHOWDIRTYSTATE='y'
  GIT_PS1_SHOWUNTRACKEDFILES='y'
  hash __git_ps1 &>/dev/null && __git_ps1 ' (git %s) '
}

PS1='[$(date +"%T")] \u@\h:\w\[$(tput setaf 3)\]$(hg_prompt)$(git_prompt)\[$(tput sgr0)\]\$ '
