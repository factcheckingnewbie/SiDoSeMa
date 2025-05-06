#!/bin/bash

USER_ID="$(id -u)"
CHROOT_DIR="/host"

sudo mount --bind /proc /host/proc

# if [ "$#" -eq 0 ]; then
#   # Interactive shell
  exec sudo chroot /host su - "$HOST_USER"
# else
#   # Run command as host user in chroot
#   exec sudo chroot /host su - "$HOST_USER" -c "$*"  ## Disabled until I know  why it fail (flashes and dissapear)
# fi
