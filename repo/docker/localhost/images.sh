#!/usr/bin/env bash
{ set +x; } 2>/dev/null

( set -x; docker images )
( set -x; docker images | grep "${PWD##*/}" );:
