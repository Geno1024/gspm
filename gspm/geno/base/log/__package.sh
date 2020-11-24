#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO_BASE_LOG" ]; then
__GSPM_INCLUDED_GENO_BASE_LOG=1

# shellcheck source=gspm/geno/base/log/log.sh
source "$GSPM_ROOT"/geno/base/log/log.sh

fi
