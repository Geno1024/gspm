#!/bin/bash

# shellcheck disable=SC2068

# shellcheck source=geno/base/log/__package.sh
include geno/base/log
TAG="BMP     "

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
    while getopts hVvW:H:p:-: opts; do
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
                    *)

                esac
                ;;
            *)
        esac
    done
}

geno::structure::bmp::main() {
    geno::base::log::debug "$TAG" "Main"
    geno::structure::bmp::handleargument $@
}

geno::structure::bmp::main $@
