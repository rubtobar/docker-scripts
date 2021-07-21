#!/bin/bash
if [[ "$#" -ne 1 ]]; then
    echo "Illegal number of parameters" >&2
    echo ""
    echo "Usage: retag-containers HOSTNAME"
    echo "Retags all the containers to a new hostname"
    exit 2
fi

for image in `docker image ls | sed '1d' | grep -v $1 | awk '{print $1":"$2}'`;
do
    docker tag $image `echo $image | sed -E 's#[^/]+/#/#' | sed 's/^[/]*/'$1'\//'`;
done