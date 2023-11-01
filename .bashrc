# .bashrc


# Defaults
# ========================================
PATH=$PATH:.
export EDITOR=vi
# history settings
shopt -s histappend
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth:erasedups


# Terminal color
# ========================================
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
else
    color_prompt=no
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;38;5;75m\]\w\[\033[00m\]\$ '
fi
unset color_prompt


# Aliases
# ========================================
alias fv='vim $(fzf)'
alias gc='git commit -S -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gl='git log --graph --oneline'
alias gp='git pull -p'
alias gs='git status'
alias hs='history | grep -i --color=auto'
alias la='ls -la'
alias ll='ls -alFh --group-directories-first'
alias ls='ls --color=auto'
alias p='ps -ef|grep "$(whoami)"| sort -n'
alias tfmt='terraform fmt -write'
alias tmux='tmux -2'
alias vimr='vim -R'


# Source .bashrc.local
# ========================================
source ~/.bashrc.local
