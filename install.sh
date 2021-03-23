#!/bin/bash

install-go () {
	echo "# Run custom actions" >> ../go
	echo "bash /boot/config/custom/go" >> ../go
	cat ../go
}

install-git-prompt () {
    curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > /boot/config/custom/profiles/.bash_git
}

install-ssh () { # /etc/rc.d/rc.sshd restart
    echo "Copy public keys to /boot/config/ssh/root/authorized_keys file"
    touch /boot/config/ssh/root/authorized_keys # --> /root/.ssh/authorized_keys
    echo "Backup /etc/ssh/sshd_config -->> /boot/config/ssh/sshd_config"
    cp /etc/ssh/sshd_config /boot/config/ssh/sshd_config.bak
    echo "SSH plugin for user: https://github.com/docgyver/unraid-v6-plugins"
    mkdir -p /boot/config/plugins/ssh/coder/.ssh
    cp /boot/config/ssh/root/authorized_keys /boot/config/plugins/ssh/coder/.ssh/authorized_keys
}

install-user-scripts () {
    # /boot/config/custom/user.scripts/ -->> /boot/config/plugins/user.scripts/scripts/
    cp -avr user.scripts/* ../plugins/user.scripts/scripts
}

install-docker-compose () {
    curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    cp /usr/local/bin/docker-compose /boot/config/custom/docker-compose
}

install-runner () {
    git clone https://github.com/stylemistake/runner
}

install () {
    install-go
    install-git-prompt
    install-ssh
    install-user-scripts
    install-docker-compose
    install-runner
}

install
