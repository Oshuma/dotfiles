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
alias enable_wireshark='sudo chgrp admin /dev/bpf*; sudo chmod g+rw /dev/bpf*'
# alias sar2='sar -u 2 0'
# alias sar5='sar -u 5 0'

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
# export LC_ALL=C # Fix 'ls' output on some systems.
export LESS='-E -M -R -X'
# export LESS='-M -R -X'
export MANPATH="/opt/local/man:$MANPATH"
export PAGER='less'
export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/WordNet-3.0/bin:$PATH"
# export PS1='\n[\h \u:\w]\$ '
# Print the title in xterms
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'

# Don't save histories to disk.
export HISTFILE=/dev/null
export IRB_HISTORY_FILE=/dev/null
export MYSQL_HISTFILE=/dev/null


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
