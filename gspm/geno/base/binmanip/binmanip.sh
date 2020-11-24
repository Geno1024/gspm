#!/bin/bash

geno::base::binmanip::print::hex1toint8() {
    xxd -r -p <<< "$1"
}

geno::base::binmanip::print::dectoint8() {
    xxd -r -p <<< "$(printf "%02x" "$1")"
}

geno::base::binmanip::print::hex2toint16be() {
    xxd -r -p <<< "$1"
}

geno::base::binmanip::print::dectoint16be() {
    geno::base::binmanip::print::hex2toint16be "$(printf "%04x" "$1")"
}

geno::base::binmanip::print::hex2toint16le() {
    xxd -r -p <<< "${1:2:2}${1:0:2}"
}

geno::base::binmanip::print::dectoint16le() {
    geno::base::binmanip::print::hex2toint16le "$(printf "%04x" "$1")"
}

geno::base::binmanip::print::hex3toint24be() {
    xxd -r -p <<< "$1"
}

geno::base::binmanip::print::dectoint24be() {
    geno::base::binmanip::print::hex3toint24be "$(printf "%06x" "$1")"
}

geno::base::binmanip::print::hex3toint24le() {
    xxd -r -p <<< "${1:4:2}${1:2:2}${1:0:2}"
}

geno::base::binmanip::print::dectoint24le() {
    geno::base::binmanip::print::hex3toint24le "$(printf "%06x" "$1")"
}

geno::base::binmanip::print::hex4toint32be() {
    xxd -r -p <<< "$1"
}

geno::base::binmanip::print::dectoint32be() {
    geno::base::binmanip::print::hex4toint32be "$(printf "%08x" "$1")"
}

geno::base::binmanip::print::hex4toint32le() {
    xxd -r -p <<< "${1:6:2}${1:4:2}${1:2:2}${1:0:2}"
}

geno::base::binmanip::print::dectoint32le() {
    geno::base::binmanip::print::hex4toint32le "$(printf "%08x" "$1")"
}
