#!/usr/bin/env bash

pacman -S --noconfirm cronie vim-minimal ruby python2

# Start cronie on boot
systemctl enable cronie

# Never generate rdoc and ri
echo "gem: --no-document" >> /etc/gemrc
