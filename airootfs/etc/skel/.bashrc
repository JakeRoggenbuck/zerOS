# ~/.bashrc
if [[ ${EUID} == 0 ]] ; then
        PS1='\[\e[01;34m\]\W\[\e[m\]$(__git_ps1) \[\e[01;32m\]▲\[\e[m\] '
else
        PS1='\[\e[00;00m\]\W\[\e[01;34m\]$(__git_ps1) \[\e[01;32m\]▲\[\e[m\] '
fi

# Aliases
alias bstr='WM=bspwm startx'
alias dstr='WM=dwm startx'

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias p='python3'

alias pe='fzf --exact --reverse'

alias j='nvim $(pe)'

alias cp='cp -i'
alias df='df -h'
alias tree='tree -C'

alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lah'
alias lt='ls --human-readable --size -1 -S --classify'
alias last='ls -t1l'
alias lview='ls -lhFA > /tmp/list && nvim /tmp/list'

alias v='nvim'
alias nv='nvim'
alias snv='sudo nvim'

alias ra='ranger'
alias sr='sudo ranger'

alias cl='clear'
alias cls='clear && ls'

alias em='emacs'
alias sem='sudo emacs'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gsw='git switch'
alias gc='git commit'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias gp='git push'
alias gra='git remote add'
alias gdc='git diff --cached'
alias gst='git status'
alias gswc='git switch -c'

alias pusho='git push origin $(git symbolic-ref --short HEAD)'
alias pullo='git pull origin $(git symbolic-ref --short HEAD)'
alias pullm='git pull upstream master'
alias pullu='git pull upstream $(git symbolic-ref --short HEAD)'
