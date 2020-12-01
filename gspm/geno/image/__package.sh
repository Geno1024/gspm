#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_IMAGE" ]; then
export __GSPM_INCLUDED_GENO_IMAGE=1

# shellcheck source=geno/image/editor/__package.sh
source "$GSPM_ROOT"/geno/image/editor/__package.sh

# shellcheck source=geno/image/template/__package.sh
source "$GSPM_ROOT"/geno/image/template/__package.sh

fi
