#!/bin/bash
#shellcheck disable=SC2068

init() {
    if [ -z "$__GSPM_INSTALLED" ]; then
        mkdir ~/.gspm
        {
            echo "export __GSPM_INSTALLED=1"
            echo "export GSPM_ROOT=~/.gspm"
            echo "include() { source \"\$GSPM_ROOT/\$1/__package.sh\" ; }"
            echo "reclude() { module=\${1^^}; module=\${module//\//_}; unset __GSPM_INCLUDED_\$module; source \"\$GSPM_ROOT/\$1/__package.sh\" ; }"
            echo "export -f include reclude"
            echo "export PATH=\$PATH:\$GSPM_ROOT"
        } >> ~/.bashrc
    fi
    source ~/.bashrc
}

version() {
    echo "GSPM Client v0.0.1 ($(head -c8 .git/refs/heads/master))"
}

--version() {
    version
}

help() {
    echo "Help"
}

--help() {
    help
}

$@
