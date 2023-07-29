#!/usr/bin/env bash

SSH_HOSTNAME="aws"
IMAGE_NAME="${PWD##*/}"

( set -x; LC_ALL=C ssh "$SSH_HOSTNAME" sudo docker images )
( set -x; LC_ALL=C ssh "$SSH_HOSTNAME" sudo docker images | grep "$IMAGE_NAME" );:
