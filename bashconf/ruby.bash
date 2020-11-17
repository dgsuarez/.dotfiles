alias brake='bundle exec rake'
alias bexec='bundle exec'

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
