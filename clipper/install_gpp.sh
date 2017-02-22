#! /bin/bash

# Some useful links:
# - http://scholtyssek.org/blog/2015/06/11/install-gcc-with-c14-support-on-ubuntumint/

set -euo pipefail

main() {
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test
    sudo apt-get update
    sudo apt-get install -y g++-6
    sudo ln -sf /usr/bin/g++-6 /usr/bin/g++
}

main
