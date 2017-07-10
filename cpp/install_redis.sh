#! /bin/bash

set -euo pipefail

main() {
    sudo apt-get install -y libhiredis-dev libev-dev
}

main
