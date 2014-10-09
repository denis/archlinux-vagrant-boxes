#!/usr/bin/env bash

sed -i "s/^#en_US.UTF-8/en_US.UTF-8/g" /etc/locale.gen
locale-gen

# Set en_US.UTF-8 as default locale system-wide
localectl set-locale LANG=en_US.UTF-8
