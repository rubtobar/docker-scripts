#!/bin/bash

if [[ "$#" -ne 1 ]]; then
    echo "Illegal number of parameters" >&2
    echo ""
    echo "Usage: push-containers HOSTNAME"
    echo "Pushes all the containers to an specific host"
    exit 2
fi

for image in `docker image ls | sed '1d' | grep $1 | awk '{print $1":"$2}'`;
do
    docker push $image;
done