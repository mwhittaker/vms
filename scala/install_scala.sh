#! /usr/bin/env bash

set -euo pipefail

main() {
    # As described in [1], we install scala by installing sbt.
    #
    # [1]: https://www.scala-lang.org/download/
    local -r version="1.1.6"
    wget "https://piccolo.link/sbt-${version}.tgz"
    tar -xzvf "sbt-${version}.tgz"
    echo 'export PATH="$PATH:$HOME/sbt/bin"' >> ~/.bash_path
}

main "$@"
