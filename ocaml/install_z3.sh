#! /bin/bash

# Links:
#  - https://github.com/Z3Prover/z3/releases

set -euo pipefail

main() {
    local readonly version="z3-4.4.1"
    local readonly zip_name="$version-x64-ubuntu-14.04"
    wget "https://github.com/Z3Prover/z3/releases/download/$version/$zip_name.zip"
    unzip "$zip_name.zip"
    mv "$zip_name" z3
    echo "Add `z3/bin` to your path!"
}

main
