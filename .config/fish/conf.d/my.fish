alias dgit='/usr/bin/git --git-dir=$HOME/code/dotfiles --work-tree=$HOME'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias ls='ls --color=auto'
alias l='ls -CF --color=auto'
#command -v exa > /dev/null && alias ll='exa -l'
#command -v exa > /dev/null && alias la='exa -a'
#command -v exa > /dev/null && alias l='exa -F'
command -v lsd > /dev/null && alias la='lsd --group-dirs first -A'
command -v lsd > /dev/null && alias ls='lsd --group-dirs first'
command -v lsd > /dev/null && alias ll='lsd --group-dirs first -l'
command -v lsd > /dev/null && alias l='lsd --group-dirs first'
command -v lsd > /dev/null && alias tree='lsd --tree'
alias v='nvim'
alias e='exit'
alias psc='ps xawf -eo pid,user,cgroup,args'
set EDITOR nvim
set PAGER bat
set TERM xterm-256color
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -gx LESS_TERMCAP_mb \e'[1;32m'
set -gx LESS_TERMCAP_md \e'[1;32m'
set -gx LESS_TERMCAP_me \e'[0m'
set -gx LESS_TERMCAP_se \e'[0m'
set -gx LESS_TERMCAP_so \e'[01;33m'
set -gx LESS_TERMCAP_ue \e'[0m'
set -gx LESS_TERMCAP_us \e'[1;4;31m'
