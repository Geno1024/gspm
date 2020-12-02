#!/bin/bash

geno::base::io::screen::width() {
    echo $COLUMNS
}

geno::base::io::screen::height() {
    echo $LINES
}

geno::base::io::screen::cursor::setposition() {
    x="$1"
    y="$2"
    echo -ne "\e[$x;${y}H"
}

geno::base::io::screen::cursor::putatlastline() {
    x=$(geno::base::io::screen::height)
    echo -ne "\e[$x;1H"
}

geno::base::io::screen::text::setforegroundcolor() {
    r="$1"
    g="$2"
    b="$3"
    echo -ne "\e[38;2;$r;$g;${b}m"
}

geno::base::io::screen::text::setbackgroundcolor() {
    r="$1"
    g="$2"
    b="$3"
    echo -ne "\e[48;2;$r;$g;${b}m"
}

geno::base::io::screen::clearscreen() {
    echo -ne "\e[2J"
}

geno::base::io::screen::text::writeattopleft() {
    x="$1"
    y="$2"
    string="$3"
    geno::base::io::screen::cursor::setposition "$x" "$y"
    echo "$string"
}

geno::base::io::screen::text::writeatcenter() {
    x="$1"
    y="$2"
    string="$3"
    length=${#string}
    y=$((y - length / 2))
    geno::base::io::screen::cursor::setposition "$x" "$y"
    echo -n "$string"
}

geno::base::io::screen::text::writeatcenterhorizontal() {
    x="$1"
    y=$(geno::base::io::screen::width)
    string="$2"
    length=${#string}
    y=$((y - length / 2))
    geno::base::io::screen::cursor::setposition "$x" "$y"
    echo -n "$string"
}

geno::base::io::screen::text::writeatcenteroffsethorizontal() {
    x="$1"
    y=$(geno::base::io::screen::width)
    height=$(geno::base::io::screen::height)
    string="$2"
    length=${#string}
    x=$((x + height / 2))
    y=$((y / 2 - length / 2))
    geno::base::io::screen::cursor::setposition "$x" "$y"
    echo -n "$string"
}

geno::base::io::screen::text::writeatcentervertical() {
    x=$(geno::base::io::screen::height)
    y="$1"
    string="$2"
    length=${#string}
    y=$((y - length / 2))
    geno::base::io::screen::cursor::setposition "$x" "$y"
    echo -n "$string"
}

geno::base::io::screen::text::writeatcenteroffsetvertical() {
    x=$(geno::base::io::screen::height)
    y="$1"
    width=$(geno::base::io::screen::width)
    string="$2"
    length=${#string}
    y=$((y - length / 2 + width / 2))
    geno::base::io::screen::cursor::setposition "$x" "$y"
    echo -n "$string"
}

geno::base::io::screen::text::writeatscreencenter() {
    x=$(geno::base::io::screen::height)
    y=$(geno::base::io::screen::width)
    string="$1"
    length=${#string}
    x=$((x / 2))
    y=$((y / 2 - length / 2))
    geno::base::io::screen::cursor::setposition "$x" "$y"
    echo -n "$string"
}
