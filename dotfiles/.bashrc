# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

### Configs ###
# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=2000000
# Append to the history file, don't overwrite it
shopt -s histappend
# Set time format
HISTTIMEFORMAT='%F %T '
# Multiple commands on one line show up as a single line
shopt -s cmdhist
# Append new history lines, clear the history list, re-read the history list, print prompt.
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you worn in (used in the prompt below).
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set the default editor
export VISUAL=vim
export EDITOR=vim

# Run tmux for each terminal
[[ -z "$TMUX" ]] && exec tmux -2

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi  

### Colors ###
# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Colorful manpages with less
export LESS_TERMCAP_mb=$'\E[01;34m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

NORMAL="\[\033[0m\]"

RED="\[\033[00;31m\]"
GREEN="\[\033[00;32m\]"
YELLOW="\[\033[00;33m\]"
BLUE="\[\033[00;34m\]"
PURPLE="\[\033[00;35m\]"
CYAN="\[\033[00;36m\]"
LIGHTGRAY="\[\033[00;37m\]"

LRED="\[\033[01;31m\]"
LGREEN="\[\033[01;32m\]"
LYELLOW="\[\033[01;33m\]"
LBLUE="\[\033[01;34m\]"
LPURPLE="\[\033[01;35m\]"
LCYAN="\[\033[01;36m\]"
WHITE="\[\033[01;37m\]"

### Prompt ###
# Add git support for PS1
source /usr/lib/git-core/git-sh-prompt
export GIT_PS1_SHOWDIRTYSTATE=yes

# Add chroot info
PS1="$CYAN${debian_chroot:+($debian_chroot)}"
# Add user and hostname
PS1="$PS1$LGREEN\u@\h$NORMAL:"
# Add the current directory
PS1="$PS1$LBLUE\w$"
# Add git branch
PS1="$PS1$YELLOW\$(__git_ps1)"
# Normalize user output
PS1="$PS1$NORMAL "

### Aliases ###
# Loading aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

### Functions ###
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xvjf $1   ;;
            *.tar.gz)  tar xvzf $1   ;;
            *.bz2)     bunzip2 $1    ;;
            *.rar)     unrar x $1    ;;
            *.gz)      gunzip $1     ;;
            *.tar)     tar xvf $1    ;;
            *.tbz2)    tar xvjf $1   ;;
            *.tgz)     tar xvzf $1   ;;
            *.zip)     unzip $1      ;;
            *.Z)       uncompress $1 ;;
            *.7z)      7z x $1       ;;
            *)         echo "Unknown format of '$1'" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

cdir () {
    mkdir -p $1
    cd $1
}