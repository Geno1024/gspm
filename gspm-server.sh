#!/bin/bash

trap on15 INT
on15() {
    echo "Received SIGINT, exiting..."
    exit 255
}

while true; do
    nc -clp 8080 -e "./gspm-server-response.sh"
done