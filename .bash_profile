
### /boot/config/custom/.bash_profile

alias l='\ls -pla'
alias ..='cd ..'
alias cd..='cd ..'
alias appdata='cd /mnt/user/appdata'
alias custom='cd /boot/config/custom'
alias plugins='cd /boot/config/plugins'
alias share='cd /mnt/user'
alias d='docker'
alias g='git'

# Runner - https://github.com/stylemistake/runner
eval $(runner --completion=bash)
alias run='runner'
