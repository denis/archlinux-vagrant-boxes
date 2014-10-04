#!/usr/bin/env bash

# Partition disk
fdisk /dev/sda << EOF
n
p
1


w
EOF

# Format partition
mkfs.ext4 /dev/sda1

# Mount partition
mount /dev/sda1 /mnt

# Install base packages
pacstrap /mnt base

# Generate fstab file, use UUID to identify filesystems
genfstab -U /mnt >> /mnt/etc/fstab

# Change root into the new system
arch-chroot /mnt <<ENDCHROOT
# Set root password
yes vagrant | passwd

# Install bootloader
pacman -S --noconfirm grub
grub-install --recheck --debug /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# Install sshd
pacman -S --noconfirm openssh

# Keep SSH speedy even when host machine or the Vagrant machine is not connected to the internet.
# This avoids a reverse DNS lookup on the connecting SSH client which can take many seconds.
sed -i "s/^#UseDNS yes/UseDNS no/g" /etc/ssh/sshd_config

# Start sshd on boot
systemctl enable sshd.service

# Start dhcpcd on boot
systemctl enable dhcpcd.service
ENDCHROOT

# Copy veewee scripts, iso images, bash files to make them available in the new system after reboot
cp /root/{*.sh,*.iso,.vbox*,.veewee*,.bash*} /mnt/root

reboot
