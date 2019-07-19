#!/bin/bash

# Set up the routing needed for the simulation.
/setup.sh

ROLE=$1
shift

if [ "$ROLE" == "client" ]; then
    echo "Starting QUIC client..."
    go run example/client/main.go -insecure $@
else
    echo "Running QUIC server on 0.0.0.0:4433"
    echo "$@"
    go run example/main.go -bind 0.0.0.0:4433 "$@"
fi
