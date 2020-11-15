#!/bin/bash

export IFS=$'\r\n '

read -r method url version
declare -A headers
while read -r key value; do
    if [[ x"$key" == "x" ]]; then
        break
    fi
    # https://stackoverflow.com/a/2265268/9035237
    declare -c key
    # https://unix.stackexchange.com/a/144308/263854
    key=${key%:}
    headers[$key]=$value
done
read -rN "${headers["Content-length"]}" body

content=$(echo -e "$body")

echo "HTTP/1.1 200 OK"
echo "Date: $(date -R)"
echo "Connection: close"
echo "Content-Length: $((${#content} + 1))"
echo ""
echo "$content"