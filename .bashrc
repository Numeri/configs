if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export JAVA_FONTS=/usr/share/fonts/TTF
export EDITOR=/usr/bin/vim
export GOPATH=~/Documents/Programming/go
export GOPROJECTS=$GOPATH/src/projects
export ANDROIDSTUDIO=~/Programs/android-studio
export FLOW=~/.flow9
export SCHOOL=~/Documents/School/Fall2019
export WORK=~/Documents/Work
export TRANSLATION=~/Documents/Work/Translating
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$ANDROIDSTUDIO/bin:$FLOW/bin

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto'
alias lt='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -a --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'
alias fixit='sudo rm -f /var/lib/pacman/db.lck && sudo pacman-mirrors -g && sudo pacman -Syyuu  && sudo pacman -Suu'
alias gnomodoro='gnome-pomodoro'

xdgopen ()
{
  if [ $# -eq 0 ]; then
    xdg-open &> /dev/null
  else
    for file in "$@"; do
      xdg-open "$file" &> /dev/null
    done
  fi
}

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

bjne() {
  "$@" > /dev/null 2>&1 &
}

if [ -f /usr/share/git/completion/git-completion.bash ]; then
	source /usr/share/git/completion/git-completion.bash 
	source /usr/share/git/completion/git-prompt.sh
else
	source /etc/bash_completion.d/git-prompt
fi

if [[ $- == *i* ]]
then
	bind '"\e[5~": history-search-backward'
	bind '"\e[6~": history-search-forward'
fi

setxkbmap -option caps:escape

# prompt
#PS1='[\u@\h \W]\$ '
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[0;32m\]$(__git_ps1 "(%s)")\$\[\e[m\] '
