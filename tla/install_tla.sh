#! /usr/bin/env bash

set -euo pipefail

main() {
    mkdir -p "$HOME/install"
    cd "$HOME/install"

    sudo apt-get install unzip
    local -r tla_version=1.5.7
    wget "https://github.com/tlaplus/tlaplus/releases/download/v${tla_version}/TLAToolbox-${tla_version}-linux.gtk.x86_64.zip"
    unzip "TLAToolbox-${tla_version}-linux.gtk.x86_64.zip"
}

main "$@"
