#! /bin/bash

set -euo pipefail

main() {
    curl https://sh.rustup.rs -sSf > rustup.sh
    sh rustup.sh -y
}

main
