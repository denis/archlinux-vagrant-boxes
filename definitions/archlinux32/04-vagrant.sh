#!/usr/bin/env bash

useradd --system --create-home --groups wheel,vboxsf vagrant

# Set password to "vagrant"
yes vagrant | passwd

# Install the "insecure" public key
mkdir -m 700 /home/vagrant/.ssh

curl "https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub" \
  -o /home/vagrant/.ssh/authorized_keys

chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
