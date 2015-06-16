#!/bin/bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#if [ "$(uname)" == "Darwin" ]
#then
#    # mac stuff here
#fi

if [ "$color_prompt" = yes ]; then
    # Prior to change displaying current git branch
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

    if [ "$(uname)" == "Darwin" ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ ';
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(__git_ps1 "(%s)") \$ ';
    fi

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ack=ack-grep
alias cgrep="grep --color=always"

alias cd..='cd ..'
alias cd...='cd ../../../'
alias cd....='cd ../../../../'
alias cd.....='cd ../../../../../'
alias cd......='cd ../../../../../../'
alias cd.2='cd ../../'
alias cd.3='cd ../../../'
alias cd.4='cd ../../../../'
alias cd.5='cd ../../../../../'
alias cd.6='cd ../../../../../../'
alias cd.7='cd ../../../../../../../'

alias vi=vim
alias fastping='ping -c 100 -s.2'

alias ports='netstat -tulanp'
alias meminfo='free -m -l -t'

alias tree='tree -Csuh'

alias fn='find . -name '

alias watchmem="watch -n 1 -c -d 'free -m'"

alias psqlp="psql -h rs.pinky.doit9.com -p 5439 --user pinky -d evmemain"

alias gits="git status"
alias gitsmu="git submodule update --init --recursive"
alias gitlg="git lg"
alias gitclean="git branch --merged | grep -v \"\\*\" | xargs -n 1 git branch -d"


alias studiokeyboard="ibus-daemon -rd"




cdir () { mkdir $@ && cd $@; } #create a dir and cd into it

h () {  #improved history
    if [[ -z "$@" ]] ; then
        history | less
    else
        history | grep $@
    fi
}


stubborn () { #retry until works
    while ! $@ ; do sleep 1; done
}

bool () { #return true/false strings
    if $@ ; then
        echo "true"
    else
        echo "false"
    fi
}

#cd history, adapted from http://www.petefreitag.com/item/66.cfm
rvmcd () { cd $1;}
#this is here since it overrides rvm's cd function which I don't like much
function cd { if [ -n "$1" ]; then pushd "$1" >/dev/null; else pushd "$HOME" >/dev/null; fi; }
alias bd='popd >/dev/null'

line_count () { #count identical lines
    sort | uniq -c | sort -k1nr
}

# Find a file with a pattern in name:
ff() { find . -type f -iname '*'"$*"'*' -ls ; }

repeat()       # Repeat n times command.
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}

htmlbody() {
    curl -s $1 | w3m -dump -T text/html
}

sleepsort () {
    parallel -j $# -i sh -c "sleep {} && echo {}" -- $@
}

bashreload() {
    source ~/.bashrc
}

pyclean() {
    echo "Removed" `find -name "*.pyc" -print -exec rm -f {} \; | wc -l` "pyc Files"
    echo "Removed" `find -name "*.pyo" -print -exec rm -f {} \; | wc -l` "pyo Files"
}

hh() {

    _usage() { 
        echo "usage: YOUR_COMMAND | hh [-i] [-d] args...
    -i : ignore case
    -d : disable regexp"
    }

    local _OPTS

    # detect pipe or tty
    if test -t 0; then 
        _usage
        return
    fi

    # magae flags
    while getopts ":idQ" opt; do
        case $opt in 
           i) _OPTS+=" -i " ;;
           d)  _OPTS+=" -Q " ;;
           Q)  _OPTS+=" -Q " ;;
               # let's keep hidden compatibility with -Q for original ack users
           \?) _usage
                return ;;
        esac
    done
    
    shift $(($OPTIND - 1))

    # check maximum allowed input
    if (( ${#@} > 12)); then
        echo "Too many terms. h supports a maximum of 12 groups. Consider relying on regular expression supported patterns like \"word1\\|word2\""
        exit -1
    fi;

    # set zsh compatibility
    [[ -n $ZSH_VERSION ]] && setopt localoptions && setopt ksharrays && setopt ignorebraces

    local _i=0

    #inverted-colors-last scheme
    _COLORS=( "underline bold red" "underline bold green" "underline bold yellow"  "underline bold blue"  "underline bold magenta"  "underline bold cyan" "bold on_red" "bold on_green" "bold black on_yellow" "bold on_blue"  "bold on_cyan" "bold on_magenta"  )
    #inverted-colors-first scheme
    #_COLORS=( "bold on_red" "bold on_green" "bold black on_yellow" "bold on_blue" "bold on_magenta" "bold on_cyan" "bold black on_white"  "underline bold red" "underline bold green" "underline bold yellow"  "underline bold blue"  "underline bold magenta"     )

    # build the filtering command
    for keyword in "$@"
    do
        local _COMMAND=$_COMMAND"ack $_OPTS --noenv --flush --passthru --color --color-match=\"${_COLORS[$_i]}\" '$keyword' |"
        _i=$_i+1
    done
    #trim ending pipe
    _COMMAND=${_COMMAND%?}
    #echo "$_COMMAND"
    cat - | eval $_COMMAND
}

evwifi() {
    sudo pkill -9 wpa_supplicant
    sudo ifconfig wlan0 down
    sudo ifconfig wlan0 up
}


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export HISTSIZE=10000
shopt -s histappend
export LC_ALL=C
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8 sublime_text


if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi


#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/eshel/.gvm/bin/gvm-init.sh" ]] && source "/Users/eshel/.gvm/bin/gvm-init.sh"
