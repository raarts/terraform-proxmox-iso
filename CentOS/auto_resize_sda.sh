#!/bin/sh
# unfortunately I could not get this working on CentOS, due to 
# resizepart not accepting a size in GB
exit 0

# Use parted to extend root partition to available /dev/sda space
END=$(parted /dev/sda print free  | grep Free | tail -1 | awk "{print \$2}")
if [ -n "$END" ]
then
  resizepart /dev/sda 2 $END
  pvresize /dev/sda2
  VGROUP=$(mount | grep root | awk "{ print \$1 }")
  lvextend -l +100%FREE -r $VGROUP
else
  echo "No free space found"
fi

