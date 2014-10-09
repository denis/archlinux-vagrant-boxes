#!/usr/bin/env bash

pacman -S --noconfirm virtualbox-guest-utils

cat <<EOF > /etc/modules-load.d/virtualbox.conf
vboxguest
vboxsf
vboxvideo
EOF

systemctl enable vboxservice.service
