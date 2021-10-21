# UnraidCustomScripts
Some custom scripts for Unraid server

## Prerequisites

List of plugins that need to be installed:
- Community Applications
- Dynamix S3 Sleep
- Dynamix SSD TRIM
- User Scripts

## Cold Install

Installation in the persistant volume `/boot/config/custom`
```sh
$ cd /boot/config
$ git clone https://github.com/Starli0n/UnraidCustomScripts.git custom
$ cd custom
$ bash install.sh
```

## Hot Install

Installation at boot in made by the script `/boot/config/custom/go`

## SSH Config

| Name            | Cold File                          | Hot File               |
|-----------------|------------------------------------|------------------------|
| Original backup | `/boot/config/ssh/sshd_config.bak` | -                      |
| Config          | `/boot/config/ssh/sshd_config`     | `/etc/ssh/sshd_config` |
| Root config     | `/boot/config/ssh/root`            | `/root/.ssh`           |
| User config     | `/boot/config/plugins/ssh`         | `/home/user/.ssh`      |

Restart sshd: `/etc/rc.d/rc.sshd restart`
