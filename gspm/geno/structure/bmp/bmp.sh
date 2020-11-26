#!/bin/bash

# shellcheck disable=SC2068

# shellcheck source=geno/base/log/__package.sh
include geno/base/log

# shellcheck source=geno/base/binmanip/__package.sh
include geno/base/binmanip

verboseLevel=0

geno::structure::bmp::help() {
    cat << EOF
Usage: $0 [-hVv] [options]

Options:
-c, --compression       Compression method
                        possible value: "no"
-W, --width             Width
                        possible value: "auto", uint32
-H, --height            Height
                        possible value: "auto", uint32
-p, --plane             path to file containing color pixels
                        color pixel format: RRGGBB
-o, --output            path to output file
EOF
}

geno::structure::bmp::version() {
    cat << EOF
    $0 v00.01.0001 by Geno1024 (Y. Z. Chen)
EOF
}

geno::structure::bmp::verbose() {
    verboseLevel=$((verboseLevel + 1))
}

geno::structure::bmp::handleargument() {
    OPTIND=1
    while getopts hVvW:H:p:o:-: opts; do
        case $opts in
            h)
                geno::structure::bmp::help
                ;;
            V)
                geno::structure::bmp::version
                ;;
            v)
                geno::structure::bmp::verbose
                ;;
            W)
                width=$OPTARG
                ;;
            H)
                height=$OPTARG
                ;;
            p)
                plane=$OPTARG
                ;;
            o)
                output=$OPTARG
                ;;
            -)
                OPTARG=${OPTARG#-*}
                case ${OPTARG%=*} in
                    help)
                        geno::structure::bmp::help
                        ;;
                    version)
                        geno::structure::bmp::version
                        ;;
                    verbose)
                        geno::structure::bmp::verbose
                        ;;
                    width)
                        width=${OPTARG#*=}
                        ;;
                    height)
                        height=${OPTARG#*=}
                        ;;
                    plane)
                        plane=${OPTARG#*=}
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

geno::structure::bmp::parseplane() {
    geno::base::log::debug "BMP     " "ParsePlane Begin"
    if [[ x"$width" == "xauto" ]] || [[ x"$width" == "x" ]]; then
        width=$(head -n1 "$1" | awk '{ print NF }')
        geno::base::log::debug "BMP     " "ParsePlane redefine width as $width"
    fi
    if [[ x"$height" == "xauto" ]] || [[ x"$height" == "x" ]]; then
        height=$(wc -l "$1" | awk '{ print $1 }')
        geno::base::log::debug "BMP     " "ParsePlane redefine height as $height"
    fi
    geno::base::log::debug "BMP     " "ParsePlane writing rawplane temp at $2"
    # shellcheck disable=SC2016
    awk '{ for (i = 1; i <= NF; i++) { printf("%s%s%s ", substr($i, 5, 2), substr($i, 3, 2), substr($i, 0, 2)) }; print "" }' "$1" | tac | xxd -r -p > "$2"
    geno::base::log::debug "BMP     " "ParsePlane End"
}

geno::structure::bmp::outputheader() {
    geno::base::log::debug "BMP     " "OutputHeader Begin"
    {
        # File header: BM
        geno::base::binmanip::print::hex2toint16be "424d"
        # File size
        geno::base::binmanip::print::dectoint32le "$(($(geno::base::io::read::filesize "$1") + 54))"
        # Reserved
        geno::base::binmanip::print::hex2toint16le "0000"
        # Reserved
        geno::base::binmanip::print::hex2toint16le "0000"
        # Offset to raw data, currently hardcoded
        geno::base::binmanip::print::dectoint32le "54"
        # DIB header size, currently hardcoded
        geno::base::binmanip::print::dectoint32le "40"
        # Width
        geno::base::binmanip::print::dectoint32le "$width"
        # Height
        geno::base::binmanip::print::dectoint32le "$height"
        # Number of planes
        geno::base::binmanip::print::dectoint16le "1"
        # Color depth
        geno::base::binmanip::print::dectoint16le "24"
        # Compression
        geno::base::binmanip::print::dectoint32le "0"
        # Data size
        geno::base::binmanip::print::dectoint32le "$(geno::base::io::read::filesize "$1")"
        # X resolution
        geno::base::binmanip::print::dectoint32le "0"
        # Y resolution
        geno::base::binmanip::print::dectoint32le "0"
        # Number of color palettes
        geno::base::binmanip::print::dectoint32le "0"
        # Number of important colors
        geno::base::binmanip::print::dectoint32le "0"

    } > "$output"
    geno::base::log::debug "BMP     " "OutputHeader End"
}

geno::structure::bmp::outputbody() {
    geno::base::log::debug "BMP     " "OutputBody Begin"
    cat "$1" >> "$output"
    geno::base::log::debug "BMP     " "OutputBody End"
}

geno::structure::bmp::main() {
    geno::base::log::debug "BMP     " "Main Begin"
    geno::structure::bmp::handleargument "$@"
    __GSPM_BMP_RAWPLANE="$(mktemp)"
    geno::structure::bmp::parseplane "$plane" "$__GSPM_BMP_RAWPLANE"
    geno::structure::bmp::outputheader "$__GSPM_BMP_RAWPLANE"
    geno::structure::bmp::outputbody "$__GSPM_BMP_RAWPLANE"
    rm "$__GSPM_BMP_RAWPLANE"
    geno::base::log::debug "BMP     " "Main End"
}
