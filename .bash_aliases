#!/bin/bash

# apt-get shortcuts
alias ins='sudo apt-get install'

# Moving around
alias cdc='cd ..'
alias ls='ls -v'
alias ll='ls -alF'
alias lla='ls -altv'
alias la='ls -av'

# tmux related
alias ta='tmux attach'
alias tn='tmux new -s'

# Map C source codes
alias csd='cscope -d'
alias csr='cscope -R'
alias src='ctags -R; csr'

# (some) Git commands
alias gc='git commit'
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gu='git pull'

# Remote servers
alias sns12a='ssh davidliu@sns12a'
alias portal='ssh hl7@portal.cs.princeton.edu'

# VirtualBox
alias VBoxManage='vboxmanage'

# Rust dev
alias cb='cargo build'
alias cbr='cargo build --release'
alias cbb='cargo build --release; cargo build'

# firecracker dev
alias ffc='ps aux | grep firecracker'
