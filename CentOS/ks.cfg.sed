#version=DEVEL
autostep
# System authorization information
auth --enableshadow --passalgo=sha512
# Use CDROM installation media
cdrom
# Use text mode install
text
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=sda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts=''
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=eth0 --ipv6=auto --no-activate
network  --hostname=centos-7-x8664-template.lve.novamntum.com

# Root password
rootpw --iscrypted $6$xXCnIsyNeWo3OKEU$EbayePex7kSrjg5FbgER.UOnLbXXzsiEWja8tlcYNPSRd41OjUUGp6lJ8Y2NxZ5oyIe6KqG/hWeoTOS6bvPIf.
# System services
services --enabled="chronyd"
# Do not configure the X Window System
skipx
# System timezone
timezone Etc/UTC --isUtc
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
autopart --type=lvm
# Partition clearing information
clearpart --all --initlabel --drives=sda

# Reboot when done
reboot

%packages
@core
chrony
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end

