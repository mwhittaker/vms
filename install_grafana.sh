#! /usr/bin/env bash

set -euo pipefail

main() {
    mkdir -p "$HOME/install"
    cd "$HOME/install"

    # See [1, 2, 3] for download links.
    #
    # [1]: https://grafana.com/docs/installation/debian/
    # [2]: https://grafana.com/get
    # [3]: https://grafana.com/grafana/download
    local -r grafana='grafana-6.1.3.linux-amd64.tar.gz'
    wget "https://dl.grafana.com/oss/release/$grafana"
    tar -xzvf "$grafana"
}

main
