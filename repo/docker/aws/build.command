#!/usr/bin/open -a Terminal
{ set +x; } 2>/dev/null

[[ -z "$SSH_HOSTNAME" ]] && SSH_HOSTNAME="aws"
[[ -z "$DOCKER_NAME" ]] && DOCKER_NAME="${PWD##*/}"

( set -x; LC_ALL=C ssh "$SSH_HOSTNAME" sudo docker system prune -f ) || exit
( set -x; /usr/local/bin/docker-upload-and-build "$SSH_HOSTNAME" "$DOCKER_NAME" . )
