#!/usr/bin/env bash

aws_dirname=/usr/share/docker-compose/"${PWD##*/}"

filename="docker-compose.yml"
aws_tmp=/tmp/docker-compose.yml
aws_filename="$aws_dirname"/docker-compose.yml

LC_ALL=C scp "$filename" ubuntu@aws:"$aws_tmp"
LC_ALL=C ssh ubuntu@aws sudo mkdir -p "$aws_dirname"
LC_ALL=C ssh ubuntu@aws sudo cp "$aws_tmp" "$aws_filename"
echo "$aws_filename"

filename="docker-compose.prod.yml"
aws_tmp=/tmp/docker-compose.prod.yml
aws_filename="$aws_dirname"/"$filename"

! [ -e "$filename" ] && echo "SKIP: $filename NOT EXISTS" && exit

LC_ALL=C scp docker-compose.prod.yml ubuntu@aws:"$aws_tmp"
LC_ALL=C ssh ubuntu@aws sudo mkdir -p "$aws_dirname"
LC_ALL=C ssh ubuntu@aws sudo cp "$aws_tmp" "$aws_filename"
echo "$aws_filename"
