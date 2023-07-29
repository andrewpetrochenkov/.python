#!/usr/bin/open -a Terminal
{ set +x; } 2>/dev/null

SSH_HOSTNAME="aws"
IMAGE_NAME="${PWD##*/}"
ENV_FILE="/usr/share/docker-compose/${PWD##*/}/.env"

( set -x; ssh "$SSH_HOSTNAME" sudo docker run --entrypoint='' --env-file "$ENV_FILE" "$IMAGE_NAME" python -u manage.py migrate )
