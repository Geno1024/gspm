#!/bin/bash

geno::base::io::screen::width() {
    echo $COLUMNS
}

geno::base::io::screen::height() {
    echo $LINES
}

geno::base::io::screen::setcursorposition() {
    x="$1"
    y="$2"
    echo -ne "\e[$x;${y}H"
}

geno::base::io::screen::setforegroundcolor() {
    r="$1"
    g="$2"
    b="$3"
    echo -ne "\e[38;2;$r;$g;${b}m"
}

geno::base::io::screen::setbackgroundcolor() {
    r="$1"
    g="$2"
    b="$3"
    echo -ne "\e[48;2;$r;$g;${b}m"
}

geno::base::io::screen::clearscreen() {
    echo -ne "\e[2J"
}

geno::base::io::screen::writeatTL() {
    x="$1"
    y="$2"
    string="$3"
    geno::base::io::screen::setcursorposition "$x" "$y"
    echo "$string"
}

geno::base::io::screen::writeatC() {
    x="$1"
    y="$2"
    string="$3"
    length=${#string}
    y=$((y - length / 2))
    geno::base::io::screen::setcursorposition "$x" "$y"
    echo -n "$string"
}

geno::base::io::screen::writeatSC() {
    x=$(geno::base::io::screen::height)
    y=$(geno::base::io::screen::width)
    string="$1"
    length=${#string}
    x=$((x / 2))
    y=$((y / 2 - length / 2))
    geno::base::io::screen::setcursorposition "$x" "$y"
    echo -n "$string"
}
