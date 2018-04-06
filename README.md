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
* Auto partition virtual disk (/dev/sda) with LVM
* OpenSSH server is installed
* Bring up only eth1 for flexible user-net SSH port forwarding
* Includes script to auto-resize partitions to the current size of
  vitual disk /etc/auto_resize_sda.sh

SECURITY WARNING!
-----------------

Note that the root password given in the config.sh file is in cleartext, and as such
ends up in the `ks.cfg` or `unattended.seed` files inside the ISO!! You will have to
change the templates for those files to change that. 

This has been done this way, because OSX has no known way of encrypting sha512 passwords 
from the command line. 


Building
--------

From the Ubuntu or CentOS directory, edit configuration in

	config.sh

Building ISO images:

	./build-iso config.sh
	
The result can be found in the `../build` directory.
Downloaded ISO Images are cached in `../cache`.

