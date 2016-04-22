#!/usr/bin/env bash

pacman -S --noconfirm cronie vim base-devel ruby python2

# Start cronie on boot
systemctl enable cronie

# Never generate rdoc and ri
echo "gem: --no-document" >> /etc/gemrc

gem install chef --no-user-install
