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

create() {
    package() {
        packagename="$1"
        mkdir -p "$GSPM_ROOT/$packagename"
        create manifest "$packagename"
        cat << EOF > "$GSPM_ROOT/$packagename/${packagename##*/}.sh"
#!/bin/bash

EOF
        update manifest
    }

    tool() {
        :
    }
    $@
}

update() {
    manifest() {
        find "$GSPM_ROOT/" -type d -exec bash -c '
            packagename=$(realpath --relative-to=$GSPM_ROOT $1)
            {
                echo "#!/bin/bash"
                echo ""
                echo "if [ -z \"\$__GSPM_INCLUDED_$(temp=${packagename^^}; echo "${temp//\//_}")\" ]; then"
                echo "export __GSPM_INCLUDED_$(temp=${packagename^^}; echo "${temp//\//_}")=1"
                echo ""
                for file in $(ls $1); do
                    if [ "$file" = "__package.sh" ]; then
                        continue
                    elif [ -d "$1/$file" ]; then
                        echo "# shellcheck source=$packagename/$file/__package.sh"
                        echo "source \"\$GSPM_ROOT\"/$packagename/$file/__package.sh"
                    elif [ -f "$1/$file" ]; then
                        echo "# shellcheck source=$packagename/$file"
                        echo "source \"\$GSPM_ROOT\"/$packagename/$file"
                    fi
                    echo ""
                done
                echo "fi"
            } > "$GSPM_ROOT/$packagename/__package.sh"
        ' _ {} \;
    }
    $@
}

version() {
    echo "GSPM Client v0.0.1 ($(head -c8 .git/refs/heads/master))"
}

--version() {
    version
}

help() {
    echo "Usage: $0 [subcommands]
Subcommands are:
init
create 
    package
version
help
    "
}

--help() {
    help
}

$@
