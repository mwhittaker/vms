#! /bin/bash

set -euo pipefail

main() {
    sudo apt-add-repository ppa:swi-prolog/stable
    sudo apt-get update
    sudo apt-get install -y swi-prolog
}

main
