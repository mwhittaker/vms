#! /usr/bin/env bash

set -euo pipefail

main() {
    mkdir -p "$HOME/install"
    cd "$HOME/install"

    if [[ ! -d efs-utils ]]; then
        git clone git@github.com:aws/efs-utils.git
    fi
    cd efs-utils
    sudo apt-get install binutils nfs-common stunnel4
    ./build-deb.sh
    sudo dpkg -i ./build/amazon-efs-utils*.deb
}

main "$@"
