#! /usr/bin/env bash

set -euo pipefail

main() {
    mkdir -p "$HOME/install"
    cd "$HOME/install"

    # See [1] for download links.
    #
    # [1]: https://prometheus.io/download/
    local -r prometheus="prometheus-2.8.1.linux-amd64"
    wget "https://github.com/prometheus/prometheus/releases/download/v2.8.1/${prometheus}.tar.gz"
    tar -xzvf "${prometheus}.tar.gz"
    echo 'export PATH="$HOME/install/'"${prometheus}"':$PATH"' >> ~/.bash_path
}

main
