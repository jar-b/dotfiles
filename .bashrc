# .bashrc


# Defaults
# ========================================
PATH=$PATH:.
export EDITOR=vi


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
alias p='ps -ef|grep "$(whoami)"| sort -n'
alias ls='ls --color=auto'
alias la='ls -la'
alias ll='ls -alFh --group-directories-first'
alias vimr='vim -R'
alias gs='git status'


# Source .bashrc.local
# ========================================
source ~/.bashrc.local
