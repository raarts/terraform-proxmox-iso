#

# Arguments given to the download router.
: ${DISTRO:="CentOS"}
: ${VERSION:="7"}
: ${RELEASE:="latest"}

# Architecture being built (i386 or amd64).
: ${ARCH:="x86_64"}

# location to download from
MIRROR=`curl -s "http://mirrorlist.centos.org/?release=$VERSION&arch=$ARCH&repo=os" | tail -5 | head -1 | sed -e 's:/os/:/isos/:g'`
ISONAME=`curl -s $MIRROR/0_README.txt | grep Minimal | grep .iso`
: ${URL:=$MIRROR/$ISONAME}

# Hardcoded host information.
: ${HOST:="tfnode"}
: ${DOMAIN:="terraform.io"}
: ${ROOT_PASSWORD:=`openssl rand -base64 24`}
: ${USERNAME:="centos"}
: ${PASSWORD:="CentosPassword"}

