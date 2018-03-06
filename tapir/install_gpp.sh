#! /usr/bin/env bash

set -euo pipefail

main() {
    # This won't install the latest version of g++, but TAPIR doesn't need it.
    sudo apt-get install -y g++
}

main
