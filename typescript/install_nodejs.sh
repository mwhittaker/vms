#! /bin/bash

set -euo pipefail

main() {
    # https://nodejs.org/en/download/package-manager/
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    sudo apt-get install -y build-essential nodejs
}

main
