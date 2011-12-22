alias brake='bundle exec rake'
alias bspec='bundle exec spec'
alias bexec='bundle exec'

v(){
  if [ -z "$1" ]; then
    gvim
  else
    gvim --remote-tab-silent $@ 
  fi
}
