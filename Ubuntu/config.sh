#

# Arguments given to the download router.
: ${DISTRO:="Ubuntu"}
: ${VERSION:="14.04.5"}
: ${RELEASE:="latest"}
: ${ARCH:="amd64"}

# location to download from
: ${URL:=http://releases.ubuntu.com/$VERSION/ubuntu-$VERSION-server-$ARCH.iso}

# Hardcoded host information.
: ${HOST:="tfnode"}
: ${DOMAIN:="terraform.io"}
: ${ROOT_PASSWORD:=`openssl rand -base64 24`}
: ${USERNAME:="ubuntu"}
: ${KERNEL:="linux-$([ "$ARCH" = "i386" ] && echo generic-pae || echo server)"}


