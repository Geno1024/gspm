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
if [[ "$method" == "POST" ]]; then
    read -rN "${headers["Content-length"]}" body
fi

# content=$(echo -e "$body")
content="Hello!"

echo "HTTP/1.1 200 OK"
echo "Date: $(date -R)"
echo "Server: GSPM Server v0.0.1 ($(head -c8 .git/refs/heads/master))"
echo "Connection: close"
echo "Content-Length: $((${#content}))"
echo ""
echo "$content"
