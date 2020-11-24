#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_QUINE" ]; then
__GSPM_INCLUDED_GENO_QUINE=1

# shellcheck source=geno/quine/main.sh
source "$GSPM_ROOT"/geno/quine/main.sh

fi
