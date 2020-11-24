#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_STRUCTURE_BMP" ]; then
export __GSPM_INCLUDED_GENO_STRUCTURE_BMP=1

# shellcheck source=geno/structure/bmp/bmp.sh
source "$GSPM_ROOT"/geno/structure/bmp/bmp.sh

fi
