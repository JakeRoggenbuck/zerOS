#
# ~/.bashrc
#

HISTSIZE=100000
HISTFILESIZE=200000

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ ${EUID} == 0 ]] ; then
        PS1='\[\e[01;34m\]\W\[\e[m\]$(__git_ps1) \[\e[01;32m\]▲\[\e[m\] '
else
        PS1='\[\e[00;00m\]\W\[\e[01;34m\]$(__git_ps1) \[\e[01;32m\]▲\[\e[m\] '
fi

# Git auto complete
source ~/.scripts/git-completion

# Git promt config
source ~/.scripts/git-prompt

# Aliases
alias bstr='WM=bspwm startx'
alias dstr='WM=dwm startx'

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias fil='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

alias p='python3'

alias pe='fzf --exact --reverse'

alias j='nvim $(pe)'

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias tree="tree -C"

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

alias gls='git log --pretty=oneline --abbrev-commit'
alias logg='git log --graph --decorate --all'
alias bgd='feh --bg-fill'
alias groffme='groff -Tps -me'
alias count="find . -type f | wc -l"
alias gp="bgd ~/.gp"
alias ytau="youtube-dl -x --audio-format mp3"
alias lintit='git ls-files *.py | xargs pylint'
alias vos="sox -t pulseaudio default -t pulseaudio null pitch -200 rate -v -L -b 90 20k gain -10"

function ckpull () {
    if [[ "$1" =~ ^[0-9]+$ ]]; then
	git fetch upstream pull/"$1"/head && git checkout FETCH_HEAD
    else
	if [ -n "$2" ]; then
	    if [[ "$2" =~ ^[0-9]+$ ]]; then
		git fetch "$1" pull/"$2"/head && git checkout FETCH_HEAD
	    else
		echo "To specify a branch and a PR, do branch first, then PR #"
	    fi
	else
	    echo "Specify PR and branch name"
	fi
    fi
}

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0232323" #black
    echo -en "\e]P82B2B2B" #darkgrey
    echo -en "\e]P1D75F5F" #darkred
    echo -en "\e]P9E33636" #red
    echo -en "\e]P287AF5F" #darkgreen
    echo -en "\e]PA98E34D" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBFFD75F" #yellow
    echo -en "\e]P48787AF" #darkblue
    echo -en "\e]PC7373C9" #blue
    echo -en "\e]P5BD53A5" #darkmagenta
    echo -en "\e]PDD633B2" #magenta
    echo -en "\e]P65FAFAF" #darkcyan
    echo -en "\e]PE44C9C9" #cyan
    echo -en "\e]P7E5E5E5" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
