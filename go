#!/bin/bash

# Run at boot
# Should be called by /boot/config/go

# Activate WOL
ethtool -s eth0 wol g

touch /root/go.done
