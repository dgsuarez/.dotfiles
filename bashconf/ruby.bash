alias brake='bundle exec rake'
alias bexec='bundle exec'

pspec(){
  bundle exec rake parallel:spec[$@]
}

bspec(){
  if [ -z "$1" ]; then
    bundle exec spec spec
  else
    bundle exec spec $@
  fi
}

brspec(){
  if [ -z "$1" ]; then
    bundle exec rspec spec
  else
    bundle exec rspec $@
  fi
}

rails(){
  if [ -f bin/spring ]; then
    bin/spring rails "$@"
  else
    bundle exec rails "$@"
  fi
}
