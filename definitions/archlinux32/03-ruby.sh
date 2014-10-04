#!/usr/bin/env bash

pacman -S --noconfirm ruby

# Never generate rdoc and ri
echo "gem: --no-document" >> /etc/gemrc
