# Arch Linux Vagrant Base Boxes

## Usage

If you have Vagrant 1.5, you can use these boxes through [Vagrant Cloud](https://vagrantcloud.com/denis):

    vagrant init denis/archlinux32
    # -OR-
    vagrant init denis/archlinux64

## Build

If you want to build them yourself you can:

    git clone https://github.com/denis/archlinux-vagrant-boxes.git
    cd archlinux-vagrant-boxes
    bundle install

    bundle exec veewee vbox build archlinux32
    bundle exec veewee vbox export archlinux32
    # -OR-
    bundle exec veewee vbox build archlinux64
    bundle exec veewee vbox export archlinux64

## Installed Packages

* base
* grub
* openssh
* sudo
* virtualbox-guest-utils-nox
* virtualbox-guest-modules-arch
* cronie
* vim
* base-devel
* ruby
* python2
* chef (via RubyGems)
