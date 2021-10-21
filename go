#!/bin/bash

# Run at boot
# Should be called by /boot/config/go

# Users & Groups
groupadd coders             # Add coders group
usermod -g coders coder     # Change coder primary group
usermod -aG docker coder    # Add to docker group
usermod -aG docker starli0n
usermod -aG coders starli0n

# Custom profiles
cat /boot/config/custom/profiles/profile >> /etc/profile
# root
cp /boot/config/custom/profiles/user.bashrc /root/.bashrc
cat /boot/config/custom/profiles/root.bash_profile >> /root/.bash_profile
cp /boot/config/custom/profiles/.gitconfig /root/.gitconfig
# coder
cp /boot/config/custom/profiles/user.bash_profile /home/coder/.bash_profile
cp /boot/config/custom/profiles/user.bashrc /home/coder/.bashrc
cp /boot/config/custom/profiles/.bash_git /home/coder/.bash_git
cp /boot/config/custom/profiles/.gitconfig /home/coder/.gitconfig
chown -R coder:coders /home/coder
chmod 644 /home/coder/.bash_*
# starli0n
cp /boot/config/custom/profiles/root.bash_profile /home/starli0n/.bash_profile
cp /boot/config/custom/profiles/user.bashrc /home/starli0n/.bashrc
cp /boot/config/custom/profiles/.bash_git /home/starli0n/.bash_git
cp /boot/config/custom/profiles/.gitconfig /home/starli0n/.gitconfig
chown -R starli0n:users /home/starli0n
touch /root/go.done

# Activate WOL
ethtool -s eth0 wol g

# docker-compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose
# sudo cp /usr/local/bin/docker-compose /boot/config/custom/docker-compose
cp /boot/config/custom/docker-compose /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Runner - https://github.com/stylemistake/runner
mkdir -p /usr/local/completion
cp /boot/config/custom/runner/src/cli.sh /usr/local/src/cli.sh
cp /boot/config/custom/runner/src/runner.sh /usr/local/src/runner.sh
cp /boot/config/custom/runner/completion/runner.bash /usr/local/completion/runner.bash
cp /boot/config/custom/runner/bin/runner /usr/local/bin/runner
chmod +rx /usr/local/src/cli.sh
chmod +rx /usr/local/src/runner.sh
chmod +rx /usr/local/completion/runner.bash
chmod +rx /usr/local/bin/runner

# Notify
export SUBJECT="go"
export DESCRIPTION="Boot... 🤖"
bash /boot/config/plugins/dynamix/notifications/agents/Telegram.sh
