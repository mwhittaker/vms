#! /usr/bin/env bash

set -euo pipefail

main() {
    sudo add-apt-repository -y ppa:ubuntu-lxc/lxd-stable
    sudo apt-get update
    sudo apt-get install -y \
        golang \
        libjpeg-turbo8-dev \
        libglu1-mesa \

    echo "Done!"
}

main
