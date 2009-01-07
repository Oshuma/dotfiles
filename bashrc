# Saftey
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# cd shortcuts
alias :='cd ../'
alias ::='cd ../../'
alias :::='cd ../../../'
alias ::::='cd ../../../../'

# System Monitoring
alias apache_process='ps -ef | grep httpd | grep -v grep | wc -l' # count apache processes
alias topcpu='ps aux | sort -n -k 2 | tail -10'  # top 10 cpu processes
alias topmem='ps aux | sort -n -k 3 | tail -10'  # top 10 memory processes
# alias sar2='sar -u 2 0'
# alias sar5='sar -u 5 0'

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

# Development Aliases
alias ra='rake'
alias rt='rake --tasks'
alias svn-diff-less="svn diff | less "
alias vim-ide="vim -c ':TlistSessionLoad .vim-tags' -c ':TlistOpen' -c ':Project' -c ':wincmd l'"
alias gvim-ide="gvim -c ':TlistSessionLoad .vim-tags' -c ':TlistOpen' -c ':Project' -c ':wincmd l'"

# git stuff
alias ga='git add'
alias gb='git branch -a -v'
alias gca='git commit -a'
alias gd='git diff'
alias gi='git status; echo; git branch -a -v'
alias gm='git merge'
alias gnb=' git co -b' # must pass new branch name
alias gs='git status'
alias gt='git tag'

# gc      => git checkout master
# gc bugs => git checkout bugs
function gc {
	if [ -z "$1" ]; then
		git checkout master
	else
		git checkout $1
	fi
}

# General Alises
alias ls='ls -G -F'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lh='ls -lh'
alias pfind='ps aux |grep '
alias scr='screen -A -m -S '
alias ssh='ssh -2'
alias sr='screen -r '


#
# ENV Variables
#
# export DISPLAY=:0.0
export EDITOR=/usr/bin/vim
export GREP_OPTIONS='--color=auto'
# export LC_ALL=C # Fix 'ls' output on some systems.
export LESS='-E -M -R -X'
# export LESS='-M -R -X'
export MANPATH="/opt/local/man:$MANPATH"
export PAGER='less'
export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/WordNet-3.0/bin:/usr/games:$PATH"
# export PS1='\n[\h \u:\w]\$ '
# Print the title in xterms
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'

# Don't save histories to disk.
export HISTFILE=/dev/null
export IRB_HISTORY_FILE=/dev/null
export MYSQL_HISTFILE=/dev/null

# Colors
export COLOR_NONE='\[\e[0m\]' # No Color
export COLOR_WHITE='\[\e[1;37m\]'
export COLOR_BLACK='\[\e[0;30m\]'
export COLOR_BLUE='\[\e[0;34m\]'
export COLOR_LIGHT_BLUE='\[\e[1;34m\]'
export COLOR_GREEN='\[\e[0;32m\]'
export COLOR_LIGHT_GREEN='\[\e[1;32m\]'
export COLOR_CYAN='\[\e[0;36m\]'
export COLOR_LIGHT_CYAN='\[\e[1;36m\]'
export COLOR_RED='\[\e[0;31m\]'
export COLOR_LIGHT_RED='\[\e[1;31m\]'
export COLOR_PURPLE='\[\e[0;35m\]'
export COLOR_LIGHT_PURPLE='\[\e[1;35m\]'
export COLOR_BROWN='\[\e[0;33m\]'
export COLOR_YELLOW='\[\e[1;33m\]'
export COLOR_GRAY='\[\e[1;30m\]'
export COLOR_LIGHT_GRAY='\[\e[0;37m\]'

#
# Functions
#

# git shit
source $HOME/.git-completion.sh
export PS1='\n[\h \u:\w$(__git_ps1 " (%s)")]\$ ' # show git branch in prompt

# This stuff enables tcsh-style directory stacks.
# alias dirs='dirs -v'
# cd() {
#    MAX=10
#    LEN=${#DIRSTACK[@]}
#
#    if [ $# -eq 0 ] || [ "$1" = "-" ]; then
#       builtin cd "$@"
#       pushd -n $OLDPWD > /dev/null
#    else
#       pushd "$@" > /dev/null || return 1
#    fi
#
#    if [ $LEN -gt 1 ]; then
#       for i in `seq 1 $LEN`; do
#          eval p=~$i
#          if [ "$p" = "$PWD" ]; then
#             popd -n +$i > /dev/null
#             break
#          fi
#       done
#    fi
#
#    if [ $LEN -ge $MAX ]; then
#       popd -n -0 > /dev/null
#    fi
# }

# cp with progress bar
# (Only seems to work on Linux systems.)
# cp_p()
# {
#    set -e
#    strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
#       | awk '{
# 	    count += $NF
#             if (count % 10 == 0) {
#                percent = count / total_size * 100
#                printf "%3d%% [", percent
#                for (i=0;i<=percent;i++)
#                   printf "="
#                printf ">"
#                for (i=percent;i<100;i++)
#                   printf " "
#                printf "]\r"
#             }
#          }
#          END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
# }
