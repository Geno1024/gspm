#!/bin/bash
#shellcheck disable=SC2068

version() {
    echo "GSPM Client v0.0.1 ($(head -c8 .git/refs/heads/master))"
}

--version() {
    version
}

help() {
    echo "Help"
}

--help() {
    help
}

$@
