#!/bin/bash

geno::base::io::read::filesize() {
    stat -c%s "$1"
}

geno::base::io::write::stdout() {
    echo "$1"
}

geno::base::io::write::stdout() {
    echo >&2 "$1"
}

geno::base::io::read::key() {
    read -rn1
}
