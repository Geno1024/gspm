#!/bin/bash

if [ -z "$__GSPM_INCLUDED_." ]; then
export __GSPM_INCLUDED_.=1

# shellcheck source=./geno/__package.sh
source "$GSPM_ROOT"/./geno/__package.sh

fi
