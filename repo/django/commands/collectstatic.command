#!/usr/bin/open -a Terminal
{ set +x; } 2>/dev/null

[ -e .env ] && { set -o allexport; . .env || exit; }

( set -x; webpack --config assets/webpack-config/prod.js --mode=none )
( set -x; python3 manage.py collectstatic --no-input )

