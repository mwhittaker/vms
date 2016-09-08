#! /bin/bash

# Some useful links:
# - https://github.com/google/protobuf/blob/master/src/README.md
# - https://github.com/google/protobuf/releases

set -euo pipefail

main() {
    sudo apt-get install -y autoconf automake libtool curl make g++ unzip
    wget 'https://github.com/google/protobuf/releases/download/v3.0.2/protobuf-cpp-3.0.2.zip'
    unzip protobuf-cpp-3.0.2.zip
    cd protobuf-cpp-3.0.2.zip
    ./configure
    make # this takes a while
    make check
    sudo make install
    sudo ldconfig
}

main
