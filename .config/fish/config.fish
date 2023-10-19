if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Aliases
# ========================================
alias p='ps -ef|grep "$(whoami)"| sort -n'
alias ls='ls --color=auto'
alias la='ls -la'
alias ll='ls -alFh --group-directories-first'
alias vimr='vim -R'
alias gc='git commit -S -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gl='git log --graph --oneline'
alias gp='git pull -p'
alias gs='git status'
alias tmux='tmux -2'
alias hs='history | grep -i --color=auto'
# todo: move these into functions with help dialogue?

# Theme
# ========================================
set -g theme_color_scheme nord

# Key Bindings
# ========================================
set fish_key_bindings fish_user_key_bindings

# Home
# ========================================
set --append PATH "$HOME/bin"
set -gx EDITOR vim

# Go
# ========================================
set -gx GOPATH "$HOME/go"
set --append PATH "$GOPATH/bin"
alias gosrc='cd $GOPATH/src/github.com/jar-b'

# AWS
# ========================================
test -x (which aws_completer); and complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# Local
# 
# Checks for local fish configurations not intended
# to be checked into version control.
# ========================================
if test -e $HOME/.config/fish/local.fish
    source $HOME/.config/fish/local.fish
end

# keep at end
starship init fish | source