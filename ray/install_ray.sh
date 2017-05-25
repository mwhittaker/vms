#! /usr/bin/env bash

set -euo pipefail

main() {
    # http://ray.readthedocs.io/en/latest/install-on-ubuntu.html
    sudo apt-get update
    sudo apt-get install -y cmake build-essential autoconf curl libtool \
                            libboost-all-dev unzip
    pip install numpy cloudpickle funcsigs colorama psutil redis flatbuffers
    conda install libgcc
}

main
