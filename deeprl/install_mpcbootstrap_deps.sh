#! /usr/bin/env bash

set -euo pipefail

main() {
    sudo add-apt-repository -y ppa:ubuntu-lxc/lxd-stable
    sudo apt-get update
    sudo apt-get install -y \
        cmake \
        golang \
        libglu1-mesa \
        libjpeg-turbo8-dev \
        swig \
        zlib1g-dev \

    echo "Done!"
}

main
