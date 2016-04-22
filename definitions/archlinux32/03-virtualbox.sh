#!/usr/bin/env bash

pacman -S --noconfirm virtualbox-guest-utils-nox virtualbox-guest-modules-arch

cat <<EOF > /etc/modules-load.d/virtualbox.conf
vboxguest
vboxsf
vboxvideo
EOF

systemctl enable vboxservice.service
