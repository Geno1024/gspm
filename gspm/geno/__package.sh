#!/bin/bash

if [ -z "$__GSPM_INCLUDED_GENO" ]; then
export __GSPM_INCLUDED_GENO=1

# shellcheck source=geno/base/__package.sh
source "$GSPM_ROOT"/geno/base/__package.sh

# shellcheck source=geno/demo/__package.sh
source "$GSPM_ROOT"/geno/demo/__package.sh

# shellcheck source=geno/image/__package.sh
source "$GSPM_ROOT"/geno/image/__package.sh

# shellcheck source=geno/quine/__package.sh
source "$GSPM_ROOT"/geno/quine/__package.sh

# shellcheck source=geno/structure/__package.sh
source "$GSPM_ROOT"/geno/structure/__package.sh

fi
