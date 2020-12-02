#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_DEMO" ]; then
export __GSPM_INCLUDED_GENO_DEMO=1

# shellcheck source=geno/demo/xinzaouniv/__package.sh
source "$GSPM_ROOT"/geno/demo/xinzaouniv/__package.sh

fi
