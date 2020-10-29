#!/bin/bash

install-go () {
	echo "# Run custom actions" >> ../go
	echo "bash /boot/config/custom/go" >> ../go
	cat ../go
}

install-user-scripts () {
    # /boot/config/custom/user.scripts/ -->> /boot/config/plugins/user.scripts/scripts/
    cp -avr user.scripts/* ../plugins/user.scripts/scripts
}

install () {
    install-go
    install-user-scripts
}

install
