# Saftey
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# cd shortcuts
alias :='cd ../'
alias ::='cd ../../'
alias :::='cd ../../../'
alias ::::='cd ../../../../'

# General Alises
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lh='ls -lh'
alias pfind='ps aux |grep '
alias scr='screen -A -m -S '
alias ssh='ssh -2'
alias sr='screen -r '

alias getip="curl -s http://checkip.dyndns.org | sed 's/[^0-9.]//g'"
# alias getip="curl -s http://checkip.dyndns.org | sed 's/.*Current IP Address: \([0-9\.]*\).*/\1/g'"
# alias getip="wget -O - http://checkip.dyndns.org | sed 's/[^0-9.]//g'"

# Development Aliases
alias ra='rake'
alias rt='rake --tasks'

alias mra='macrake'
alias mrt='macrake --tasks'

# git stuff
alias ga='git add'
alias gb='git branch -a -v'
alias gco='git commit'
alias gcoa='git commit -a'
alias gd='git diff'
alias gi='git status; echo; git branch -a -v'
alias gm='git merge'
alias gnb=' git co -b' # must pass new branch name
alias gs='git status'
alias gt='git tag'
alias gx='gitx'

# gc      => git checkout master
# gc bugs => git checkout bugs
function gc {
	if [ -z "$1" ]; then
		git checkout master
	else
		git checkout $1
	fi
}

#
# ENV Variables
#
export EDITOR=/usr/bin/vim
export GREP_OPTIONS='--color=auto'
export LC_ALL=C # Fix 'ls' output on some systems.
export LESS='-E -M -R -X'
export PAGER='less'
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'

# Don't save histories to disk.
export HISTFILE=/dev/null
export IRB_HISTORY_FILE=/dev/null
export MYSQL_HISTFILE=/dev/null

# git shit
source $HOME/.git-completion.sh
export PS1='\n[\h \u:\w$(__git_ps1 " (%s)")]\$ ' # show git branch in prompt

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
