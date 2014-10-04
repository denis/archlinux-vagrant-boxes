#!/usr/bin/env bash

pacman -S --noconfirm sudo

# Allow members of group wheel to execute any command using sudo without a password
sed -i "s/^# %wheel ALL=(ALL) NOPASSWD/%wheel ALL=(ALL) NOPASSWD/g" /etc/sudoers
