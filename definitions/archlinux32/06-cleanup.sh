#!/usr/bin/env bash

# Set PermitRootLogin back to default value
sed -i "s/^PermitRootLogin yes/#PermitRootLogin prohibit-password/g" /etc/ssh/sshd_config

# Clean up pacman cache
yes | pacman -Scc

# Clean up log files
find /var/log -type f | while read f; do echo -ne '' > $f; done

# Delete .bash_history and all veewee related files, including this script
rm -rf /root/{*.sh,*.iso,.vbox*,.veewee*,.bash_history}

# Don't save current bash session history
unset HISTFILE

# Zero out all remaining unused disk space to save space in the final image
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
