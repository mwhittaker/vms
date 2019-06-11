#! /bin/bash

set -euo pipefail

main() {
    curl https://sh.rustup.rs -sSf | sh
    source ~/.cargo/env
    rustup component add rustfmt
    rustup component add clippy
}

main
