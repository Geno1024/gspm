#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_BASE_LOG" ]; then
export __GSPM_INCLUDED_GENO_BASE_LOG=1

# shellcheck source=geno/base/log/log.sh
source "$GSPM_ROOT"/geno/base/log/log.sh

fi
