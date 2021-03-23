
### /boot/config/custom/profiles/user.bash_profile

export SRC_DIR="/mnt/user/coder"

alias l='\ls -pla'
alias v="ls -lA"
alias ..='cd ..'
alias cd..='cd ..'
alias which='type -f'
alias root='su - root'
alias d='docker'
alias g='git'
alias src='cd $SRC_DIR'

# Runner - https://github.com/stylemistake/runner
eval $(runner --completion=bash)
alias run='runner'

### ANSI COLORS
CRE="$(echo -e '\r\033[K')"
RED="$(echo -e '\033[1;31m')"
GREEN="$(echo -e '\033[1;32m')"
YELLOW="$(echo -e '\033[1;33m')"
BLUE="$(echo -e '\033[1;34m')"
MAGENTA="$(echo -e '\033[1;35m')"
CYAN="$(echo -e '\033[1;36m')"
WHITE="$(echo -e '\033[1;37m')"
NORMAL="$(echo -e '\033[0;39m')"

_colors () {
    echo "${CRE}CRE"
    echo "${RED}RED"
    echo "${GREEN}GREEN"
    echo "${YELLOW}YELLOW"
    echo "${BLUE}BLUE"
    echo "${MAGENTA}MAGENTA"
    echo "${CYAN}CYAN"
    echo "${WHITE}WHITE"
    echo "${NORMAL}NORMAL"
}

if [ "$USER" == "root" ]; then
    export USER_COLOR="$(echo -e '\033[01;31m')"
else
    export USER_COLOR="$(echo -e '\033[01;36m')"
fi

function __status_ps1 ()
{
    if [ $? -eq 0 ]; then # Status OK = Green
        echo -e '\033[01;33m'
    else # Status KO = Red
        echo -e '\033[01;31m'
    fi
}

if [ -f /home/coder/.bash_git ]; then
    . /home/coder/.bash_git
fi

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1='\n`__user_ps1`\u\[\033[01;34m\]@\[\033[01;32m\]\h ⚡\[\033[01;33m\]\w\[\033[01;36m\]`__git_ps1``__status_ps1`\nλ \[\033[00m\]'
export PS1='\n${USER_COLOR}\u\[\033[01;34m\]@\[\033[01;32m\]\h ⚡\[\033[01;33m\]$PWD\[\033[01;36m\]`__git_ps1``__status_ps1`\nλ \[\033[00m\]'
