#!/bin/sh
set -e

mkdir /mnt/sysimage/home/__USERNAME__/.ssh
cat /run/install/repo/__PUBLIC_KEY__ >/mnt/sysimage/home/__USERNAME__/.ssh/authorized_keys
chmod 700 /mnt/sysimage/home/__USERNAME__/.ssh
chown 1000:1000 \
	/mnt/sysimage/home/__USERNAME__/.ssh \
	/mnt/sysimage/home/__USERNAME__/.ssh/authorized_keys

cp /run/install/repo/sudoers /run/install/repo/auto_resize_sda.sh /mnt/sysimage/etc/
chmod 440 /mnt/sysimage/etc/sudoers
chown 0:0 /mnt/sysimage/etc/sudoers
chmod 755 /mnt/sysimage/etc/auto_resize_sda.sh

