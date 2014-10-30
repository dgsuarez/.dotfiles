alias brake='bundle exec rake'
alias bexec='bundle exec'
alias bcap='bexec cap'
alias n2z="tr '\n' '\0'"

pspec(){
  bundle exec rake parallel:spec[$@]
}

hg(){
  if [[ "$1" =~ up* ]] && [ -z "$2" ]; then
    echo "$1 a onde mangurrian!"
  else
    /usr/bin/env hg $@
  fi
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

v(){
  if [ -z "$1" ]; then
    vim
  else
    vim --remote-tab-silent $@ 
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

dev_services(){
  upstart_services="mysql"
  rd_services="memcached redis-server"
  if [ "$1" == "on" ]; then
    for s in $upstart_services
    do
      sudo service $s start
      sudo rm /etc/init/$s.override
    done
    for s in $rd_services
    do
      sudo service $s start
      sudo update-rc.d $s enable
    done
  elif [ "$1" == "off" ]; then
    for s in $upstart_services
    do
      sudo service $s stop
      echo "manual" | sudo tee /etc/init/$s.override > /dev/null
    done
    for s in $rd_services
    do
      sudo service $s stop
      sudo update-rc.d $s disable
    done
  else
    echo "usage dev_mode on|off"
  fi
}

function serve {
  python -m SimpleHTTPServer
}

hg_prompt(){
  /usr/bin/env hg log -r . --template ' (hg {branch}:{bookmarks}) ' 2> /dev/null | sed 's/\:)/)/'
}

