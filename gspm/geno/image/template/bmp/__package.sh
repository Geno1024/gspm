#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_IMAGE_TEMPLATE_BMP" ]; then
export __GSPM_INCLUDED_GENO_IMAGE_TEMPLATE_BMP=1

# shellcheck source=geno/image/template/bmp/bmp.sh
source "$GSPM_ROOT"/geno/image/template/bmp/bmp.sh

# shellcheck source=geno/image/template/bmp/purecolor.sh
source "$GSPM_ROOT"/geno/image/template/bmp/purecolor.sh

fi
