#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_BASE_BINMANIP" ]; then
export __GSPM_INCLUDED_GENO_BASE_BINMANIP=1

# shellcheck source=geno/base/binmanip/binmanip.sh
source "$GSPM_ROOT"/geno/base/binmanip/binmanip.sh

fi
