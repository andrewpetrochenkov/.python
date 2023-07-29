#!/usr/bin/env bash

SSH_HOSTNAME="aws"
IMAGE_NAME="${PWD##*/}"
DIRNAME="/usr/share/docker-compose/${PWD##*/}"

images="$( set -x; LC_ALL=C ssh "$SSH_HOSTNAME" sudo docker images )" || exit
[[ "$images" != *"$IMAGE_NAME"* ]] && echo "SKIP: image $IMAGE_NAME NOT EXISTS" && exit

files="$( set -x; LC_ALL=C ssh "$SSH_HOSTNAME" sudo ls "$DIRNAME" )" || exit
[[ "$files" != *"docker-compose.yml"* ]] && echo "SKIP: docker-compose.yml NOT EXISTS" && exit
[[ "$files" != *"docker-compose.prod.yml"* ]] && echo "SKIP: docker-compose.prod.yml NOT EXISTS" && exit

( set -x; LC_ALL=C ssh "$SSH_HOSTNAME" sudo docker-compose -f "$DIRNAME"/docker-compose.yml -f "$DIRNAME"/docker-compose.prod.yml down )
( set -x; LC_ALL=C ssh "$SSH_HOSTNAME" sudo docker-compose  -f "$DIRNAME"/docker-compose.yml -f "$DIRNAME"/docker-compose.prod.yml up -d )
