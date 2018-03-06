#! /usr/bin/env bash

set -euo pipefail

main() {
    sudo apt-get install -y \
        libevent-dev \
        libgtest-dev \
        libprotobuf-dev \
        libssl-dev \
        pkg-config \
        protobuf-compiler \

}

main
