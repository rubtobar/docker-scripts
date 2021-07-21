#!/bin/bash

if [[ "$#" -ne 1 ]]; then
    echo "Illegal number of parameters" >&2
    echo ""
    echo "Usage: rm-containers HOSTNAME"
    echo "Removes all the containers from an specific host"
    exit 2
fi

for image in `docker image ls | grep $1 | awk '{print $1":"$2}'`;
do
    docker image rm $image;
done