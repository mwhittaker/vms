#! /usr/bin/env bash

set -euo pipefail

main() {
    mkdir -p "$HOME/install"
    cd "$HOME/install"

    # As described in [1], we install scala by installing sbt.
    #
    # [1]: https://www.scala-lang.org/download/
    local -r version="1.1.6"
    if [[ ! -f "sbt-${version}.tgz" ]]; then
        wget "https://piccolo.link/sbt-${version}.tgz"
    fi

    if [[ ! -d sbt ]]; then
        tar -xzvf "sbt-${version}.tgz"
    fi

    local s='export PATH="$PATH:$HOME/install/sbt/bin"'
    if ! grep "$s" ~/.bash_path &> /dev/null; then
        echo "$s" >> ~/.bash_path
    fi
}

main "$@"
