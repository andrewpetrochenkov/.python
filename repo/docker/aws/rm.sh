#!/usr/bin/open -a Terminal
{ set +x; } 2>/dev/null

SSH_HOSTNAME="aws"
IMAGE_NAME="${PWD##*/}"

( set -x; LC_ALL=C ssh "$SSH_HOSTNAME" sudo docker image rm -f "$IMAGE_NAME" );:
( set -x; LC_ALL=C ssh "$SSH_HOSTNAME" sudo docker system prune -f )
