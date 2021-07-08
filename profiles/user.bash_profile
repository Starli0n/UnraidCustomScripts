### /boot/config/custom/profiles/user.bash_profile

export SRC_DIR="/mnt/cache/coder"
export EDITOR='code'
export GIT_EDITOR='$EDITOR -r -w'

alias l='\ls -pla'
alias v="ls -lA"
alias ..='cd ..'
alias cd..='cd ..'
alias which='type -f'
alias spath='echo -e ${PATH//:/\\n}'
alias d='docker'
alias g='git'
alias vc='$EDITOR -r'
alias pvc='_pvc(){ "$@" | $EDITOR -r -; }; _pvc'
alias src='cd $SRC_DIR'
alias reload='exec $SHELL -l'

# Runner - https://github.com/stylemistake/runner
eval $(runner --completion=bash)
alias run='runner'

root () {
    CODE_BIN=$(\which code)
    CODE_PATH=${CODE_BIN%/bin/code}/bin
    echo "export PATH=$CODE_PATH:\$PATH" > ~/.bash_vscode
    echo "export VSCODE_IPC_HOOK_CLI=$VSCODE_IPC_HOOK_CLI" >> ~/.bash_vscode
    su - root
}

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

### PS1
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

export PS1='\n${USER_COLOR}\u\[\033[01;34m\]@\[\033[01;32m\]\h ⚡\[\033[01;33m\]$PWD\[\033[01;36m\]`__git_ps1``__status_ps1`\nλ \[\033[00m\]'

### Docker
alias d='docker'
alias dr='docker run'
alias drn='docker run --name'
alias dri='docker run -it'
alias dh='_dh(){ docker $* --help; }; _dh'
alias dhw='docker run hello-world'
alias duber='docker run -dit --name uber --volume /var/shared/default:/var/shared ubuntu /bin/bash'
alias box='docker run -it --rm -v /:/mnt -w /mnt$PWD busybox:latest'
alias dbh='_dbh(){ docker exec -it $* /bin/bash; }; _dbh'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dpse='docker ps --filter status=exited'
alias dpsl='docker ps -lq'
alias dl='docker logs -f'
alias di='docker images'
alias dia='docker images -a'
alias dp='docker pull'
alias ddt='docker diff'
alias dci='docker commit'
alias dv='docker volume'
alias dn='docker network'
alias div='docker inspect --format "{{json .Config.Volumes}}"'
alias dic='docker inspect --format "{{json .Config.Cmd}}"'
alias die='docker inspect --format "{{json .Config.Entrypoint}}"'
alias ds='_ds(){ pushd $DOCKER_HOME; docker save -o Image/${1/\//-}.tar $1; popd; }; _ds' # Replace '/' by '-' in image name
alias dload='_ds(){ pushd $DOCKER_HOME; docker load -i Image/$1.tar; popd; }; _ds'
alias drm='docker rm -f'
alias drme='docker rm $(docker ps --filter status=exited --quiet)'
alias drmc='docker rm $(docker ps --filter status=created --quiet)'
alias drma='docker rm -f $(docker ps -a -q)'
alias drmi='docker rmi'
alias drmid='docker rmi $(docker images -f "dangling=true" -q)'
alias drmia='docker rmi $(docker images -q)'
alias drmvd='docker volume rm $(docker volume ls -f "dangling=true" -q)'
alias drmnc='docker network rm $(docker network ls --filter type=custom -q)'
alias dinf='docker info'
complete -F _complete_alias d

### docker-compose
alias dc='docker-compose'
alias dcu='docker-compose up' # => docker-compose -f docker-compose.yml -f docker-compose.override.yml up
alias dcd='docker-compose down' # => docker-compose -f docker-compose.yml -f docker-compose.override.yml down
alias dcup='docker-compose -f docker-compose.yml -f production.yml up'
alias dcdp='docker-compose -f docker-compose.yml -f production.yml down'
complete -F _docker_compose dc

### extra
EXTRA=$SRC_DIR/.extra
if [ -f $EXTRA  ]; then
    alias extra='vc $EXTRA'
    . $EXTRA
fi
