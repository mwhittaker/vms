#! /bin/bash

set -euo pipefail

main() {
    wget 'https://github.com/redis/hiredis/archive/v0.13.3.tar.gz'
    tar -xzvf v0.13.3.tar.gz
    cd hiredis-0.13.3
    make
    sudo make install
}

main
