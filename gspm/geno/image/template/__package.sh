#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_IMAGE_TEMPLATE" ]; then
export __GSPM_INCLUDED_GENO_IMAGE_TEMPLATE=1

# shellcheck source=geno/image/template/bmp/__package.sh
source "$GSPM_ROOT"/geno/image/template/bmp/__package.sh

fi
