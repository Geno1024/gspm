#!/bin/bash

include geno/base/io

geno::base::log::stdout() {
    geno::base::io::write::stdout "$(date -Iseconds) [$1][$2] $3"
}

geno::base::log::stderr() {
    geno::base::io::write::stderr "$(date -Iseconds) [$1][$2] $3"
}

geno::base::log::debug() {
    geno::base::log::stdout "DEBUG" "$1" "$2"
}

geno::base::log::info() {
    geno::base::log::stdout "INFO " "$1" "$2"
}

geno::base::log::warn() {
    geno::base::log::stderr "WARN " "$1" "$2"
}

geno::base::log::error() {
    geno::base::log::stdout "ERROR" "$1" "$2"
}
