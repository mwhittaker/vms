#! /usr/bin/env bash

set -euo pipefail

main() {
    sudo apt-get install -y \
        g++ \
        libevent-dev \
        libprotobuf-dev \
        pkg-config \
        protobuf-compiler \
        libssl-dev \

}

main
