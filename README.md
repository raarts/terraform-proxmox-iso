ISO Builds for Terraform and Proxmox
=================================

Build a custom base box for Terraform+Proxmox by downloading, extracting,
tweaking, and packaging the stock ISO files.

Based on: https://github.com/Telmate/terraform-ubuntu-proxmox-iso

Supported:

* CentOS 7
* Ubuntu

Build dependencies
------------------

* `curl`(1).
* `sed`(1).
* `mkisofs`(1) from the `cdrtools` package available from MacPorts or
  Homebrew.

Runtime dependencies
--------------------

The results are bootable ISO images and so should run on any `i386` or
`amd64` or `x86_64` hardware.  They are only tested in Proxmox.

Features in the ISO
-------------------

* Configurable default user with SSH key and sudoer NOPASSWD access
* The system clock is set to UTC
* Auto partition virtual disk (/dev/vda) with LVM
* OpenSSH server is installed
* Bring up only eth1 for flexible user-net SSH port forwarding
* Includes script to auto-resize partitions to the current size of
  vitual disk /etc/auto_resize_vda.sh

Building
--------

From the Ubuntu or CentOS directory, edit configuration in

	config.sh

Building ISO images:

	./build-iso config.sh
	
The result can be found in the `../build` directory.
Downloaded ISO Images are cached in `../cache`.
