#!/usr/bin/env bash

CONTAINER_NAME="${PWD##*/}"
FILENAME="docker-compose.dev.yml"

( set -x; docker-compose -f "$FILENAME" logs )
