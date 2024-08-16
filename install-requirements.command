#!/usr/bin/open -a Terminal

# python3 -m pip install -r /path/to/requirements.txt
( set -x; python3 -m pip install --break-system-packages -r "${BASH_SOURCE[0]%/*}"/requirements.txt )
