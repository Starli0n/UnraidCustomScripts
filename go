#!/bin/bash

# Run at boot
# Should be called by /boot/config/go

# Custom /root
cat /boot/config/custom/.bash_profile >> /root/.bash_profile
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
chmod +x /usr/local/bin/runner

# Notify
export SUBJECT="go"
export DESCRIPTION="Boot... 🤖"
bash /boot/config/plugins/dynamix/notifications/agents/Telegram.sh
