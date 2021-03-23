
### /boot/config/custom/.bash_profile

if [ -f /home/coder/.bash_profile ]; then
    . /home/coder/.bash_profile
fi

alias appdata='cd /mnt/user/appdata'
alias custom='cd /boot/config/custom'
alias plugins='cd /boot/config/plugins'
alias share='cd /mnt/user'

alias ryzen-windev10-start='virsh start Windev10'
alias ryzen-windev10-pause='virsh suspend Windev10'
alias ryzen-windev10-resume='virsh resume Windev10'
