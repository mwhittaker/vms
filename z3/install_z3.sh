#! /usr/bin/env bash

set -euo pipefail

main() {
    git clone git@github.com:Z3Prover/z3.git
    cd z3
    python scripts/mk_make.py --python
    cd build
    make
    sudo make install
}

main
