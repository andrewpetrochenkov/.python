#!/usr/bin/env bash

SSH_HOSTNAME="aws"
DIRNAME="/usr/share/docker-compose/${PWD##*/}"

( set -x; LC_ALL=C ssh "$SSH_HOSTNAME" sudo docker-compose -f "$DIRNAME"/docker-compose.yml -f "$DIRNAME"/docker-compose.prod.yml down )
