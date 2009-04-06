# OS X Specific
function anonymize {
	privoxy_dir='/Library/Privoxy'
	current_dir=`pwd`
	cd $privoxy_dir &&
	sudo $privoxy_dir/privoxy --pidfile /var/run/privoxy.pid ./config > /dev/null 2>&1 &&
	open /Applications/Vidalia.app &&
	cd $current_dir
}
alias stop_privoxy='sh /Library/Privoxy/StopPrivoxy.command'
alias enable_wireshark='sudo chgrp admin /dev/bpf*; sudo chmod g+rw /dev/bpf*'
alias start_cupsd='sudo launchctl load /System/Library/LaunchDaemons/org.cups.cupsd.plist'
alias stop_cupsd='sudo launchctl unload /System/Library/LaunchDaemons/org.cups.cupsd.plist'

#
# ENV Variables
#
# export DISPLAY=:0.0
export LESS='-E -M -R -X'
export MANPATH="/opt/local/man:$MANPATH"
export PAGER='less'
export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/WordNet-3.0/bin:/usr/games:/usr/local/mysql/bin:$PATH"
# export PS1='\n[\h \u:\w]\$ '
# Print the title in xterms
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'

export IRB_HISTORY_FILE=$HOME/.irb_history

#
# Functions
#

function mamp_start {
  clear
  echo "Starting Apache..."
  sudo apachectl start &&
  cd /usr/local/mysql/ &&
  echo "Starting MySQL..."
  sudo ./bin/mysqld_safe
}

function mamp_stop {
  echo "Stopping Apache..."
  sudo apachectl stop &&
  echo "Stopping MySQL..."
  sudo mysqladmin shutdown
  echo "...done."
}
