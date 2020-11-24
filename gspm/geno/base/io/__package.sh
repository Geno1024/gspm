#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_BASE_IO" ]; then
export __GSPM_INCLUDED_GENO_BASE_IO=1

# shellcheck source=geno/base/io/io.sh
source "$GSPM_ROOT"/geno/base/io/io.sh

fi
