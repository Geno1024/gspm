#!/bin/bash

# shellcheck disable=SC2068

# shellcheck source=geno/base/log/__package.sh
include geno/base/log

# shellcheck source=geno/structure/bmp/__package.sh
include geno/structure/bmp

TAG="PURECOLO"

geno::image::template::bmp::purecolor::help() {
    cat << EOF
Usage: $0 [-hVv] [options]

Options:
-W, --width             Width
                        possible value: "auto", uint32
-H, --height            Height
                        possible value: "auto", uint32
-c, --color             Color
-o, --output            path to output file
EOF
}

geno::image::template::bmp::purecolor::version() {
    cat << EOF
    $0 v00.01.0001 by Geno1024 (Y. Z. Chen)
EOF
}

geno::image::template::bmp::purecolor::handleargument() {
    OPTIND=1
    while getopts hVvW:H:c:o:-: opts; do
        case $opts in
            h)
                geno::image::template::bmp::purecolor::help
                ;;
            V)
                geno::image::template::bmp::purecolor::version
                ;;
            W)
                width=$OPTARG
                ;;
            H)
                height=$OPTARG
                ;;
            c)
                color=$OPTARG
                ;;
            o)
                output=$OPTARG
                ;;
            -)
                OPTARG=${OPTARG#-*}
                case ${OPTARG%=*} in
                    help)
                        geno::image::template::bmp::purecolor::help
                        ;;
                    version)
                        geno::image::template::bmp::purecolor::version
                        ;;
                    width)
                        width=${OPTARG#*=}
                        ;;
                    height)
                        height=${OPTARG#*=}
                        ;;
                    color)
                        color=${OPTARG#*=}
                        ;;
                    output)
                        output=${OPTARG#*=}
                        ;;
                    *)
                        geno::base::log::error "Unrecognized option: --${OPTARG%=*}"
                esac
                ;;
            *)
                geno::base::log::error "Unrecognized option: -$opts"
        esac
    done
}

geno::image::template::bmp::purecolor::prepareplane() {
    geno::base::log::debug "PURECOLO" "PreparePlane Begin"
    width="$1"
    height="$2"
    color="$3"
    temp="$4"
    geno::base::log::debug "PURECOLO" "PreparePlane writing plane temp at $temp"
    # shellcheck disable=SC2034
    for line in $(seq 1 "$height"); do
        for row in $(seq 1 "$width"); do
            echo -n "$color "
        done
        echo ""
    done > "$temp"
    geno::base::log::debug "PURECOLO" "PreparePlane End"
}

geno::image::template::bmp::purecolor::main() {
    geno::base::log::debug "PURECOLO" "Main Begin"
    geno::image::template::bmp::purecolor::handleargument $@
    __GSPM_PURECOLOR_TEMP="$(mktemp)"
    geno::image::template::bmp::purecolor::prepareplane "$width" "$height" "$color" "$__GSPM_PURECOLOR_TEMP"
    geno::structure::bmp::main -p "$__GSPM_PURECOLOR_TEMP" -o "$output"
    geno::base::log::debug "PURECOLO" "Main End"
}
