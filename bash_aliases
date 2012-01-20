alias brake='bundle exec rake'
alias bspec='bundle exec spec'
alias bexec='bundle exec'
alias bpspec='bunde exec rake parallel:spec[2]'

v(){
  if [ -z "$1" ]; then
    gvim
  else
    gvim --remote-tab-silent $@ 
  fi
}

pending_hg(){
  (
  for dot_hg in `find -maxdepth 2 -mindepth 2 -type d -name ".hg" -exec echo "$PWD/{}/.." \;`
  do
    cd "$dot_hg" 
    hg out > /dev/null 2>&1
    h_out=$? 
    hg in > /dev/null 2>&1 
    h_in=$? 
    tput setaf 2
    (test $h_out == 0 || test $h_in == 0) && tput setaf 1
    test $h_out == 255 && tput setaf 3 
    basename $PWD
    tput sgr0
    test $h_out == 0  && echo "pending out"
    test $h_in == 0 && echo "pending in"
    test $h_out == 255 && echo "no default repo"
    echo
  done
  )
}
