#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_STRUCTURE" ]; then
export __GSPM_INCLUDED_GENO_STRUCTURE=1

# shellcheck source=geno/structure/bmp/__package.sh
source "$GSPM_ROOT"/geno/structure/bmp/__package.sh

fi
