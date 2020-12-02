#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_DEMO_XINZAOUNIV" ]; then
export __GSPM_INCLUDED_GENO_DEMO_XINZAOUNIV=1

# shellcheck source=geno/demo/xinzaouniv/xinzaouniv.sh
source "$GSPM_ROOT"/geno/demo/xinzaouniv/xinzaouniv.sh

fi
