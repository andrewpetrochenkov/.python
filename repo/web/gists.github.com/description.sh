#!/usr/bin/env bash
{ set +x; } 2>/dev/null

new="$(echo ${PWD##*/} | sed 's/"/\\"/g')" || exit
( set -x; gist-description "$id" "$new" ) || exit
echo "$new" > .git/description || exit
