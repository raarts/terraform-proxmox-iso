#!/bin/sh

# Use parted to extend root partition to available /dev/sda space
END=$(parted /dev/sda print free  | grep Free | tail -1 | awk "{print \$2}")
parted /dev/sda resizepart 2 $END
parted /dev/sda resizepart 5 $END
pvresize /dev/sda5
VGROUP=$(mount | grep root | awk "{ print \$1 }")
lvextend -l +100%FREE -r $VGROUP
