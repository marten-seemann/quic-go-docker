#!/bin/bash

ROLE=$1

docker rm quicgo &> /dev/null
docker build -t quicgo .

if [ "$ROLE" == "server" ]; then
    docker rm server &> /dev/null
    docker run --cap-add=NET_ADMIN --network rightnet --ip 192.168.100.100 --name server -it --entrypoint ./run.sh quicgo "$@"
else 
    docker run --cap-add=NET_ADMIN --network leftnet --ip 192.168.0.100 -it --entrypoint ./run.sh quicgo "$@"
fi
