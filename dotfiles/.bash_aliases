### Aliases ###
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'

alias diskspace='du -S | sort -rn'
alias folders='find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn'

alias tmux='tmux -2'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1| sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'