#!/bin/bash

export SUBJECT="Dynamix S3 Sleep"
export DESCRIPTION="Server has woke up... ⏰"
bash /boot/config/plugins/dynamix/notifications/agents/Telegram.sh
