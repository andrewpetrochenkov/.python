#!/usr/bin/open -a Terminal
{ set +x; } 2>/dev/null

ssh_hostname="aws"
path=/var/www/"${PWD##*/}"/static

[ -e .env ] && { set -o allexport; . .env || exit; }

( set -x; webpack --config assets/webpack-config/prod.js --mode=none )
( set -x; python3 manage.py collectstatic --no-input )

( set -x; ssh "$ssh_hostname" "sudo mkdir -m 777 -p $path" )
( set -x; rsync -a --delete --no-perms --no-owner --no-group --omit-dir-times static/ -e ssh "$ssh_hostname":"$path" )
