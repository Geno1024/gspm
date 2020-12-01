#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_IMAGE_EDITOR" ]; then
export __GSPM_INCLUDED_GENO_IMAGE_EDITOR=1

# shellcheck source=geno/image/editor/bmp/__package.sh
source "$GSPM_ROOT"/geno/image/editor/bmp/__package.sh

fi
