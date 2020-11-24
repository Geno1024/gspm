#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_BASE" ]; then
export __GSPM_INCLUDED_GENO_BASE=1

# shellcheck source=geno/base/binmanip/__package.sh
source "$GSPM_ROOT"/geno/base/binmanip/__package.sh

# shellcheck source=geno/base/io/__package.sh
source "$GSPM_ROOT"/geno/base/io/__package.sh

# shellcheck source=geno/base/log/__package.sh
source "$GSPM_ROOT"/geno/base/log/__package.sh

fi
