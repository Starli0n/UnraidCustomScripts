#!/bin/bash

# Run at boot
# Should be called by /boot/config/go

# Activate WOL
ethtool -s eth0 wol g

# docker-compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose
# sudo cp /usr/local/bin/docker-compose /boot/config/custom/docker-compose
cp /boot/config/custom/docker-compose /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

touch /root/go.done

export SUBJECT="go"
export DESCRIPTION="Boot... 🤖"
bash /boot/config/plugins/dynamix/notifications/agents/Telegram.sh
