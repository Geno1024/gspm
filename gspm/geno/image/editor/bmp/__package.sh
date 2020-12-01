#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_IMAGE_EDITOR_BMP" ]; then
export __GSPM_INCLUDED_GENO_IMAGE_EDITOR_BMP=1

# shellcheck source=geno/image/editor/bmp/bmp.sh
source "$GSPM_ROOT"/geno/image/editor/bmp/bmp.sh

fi
