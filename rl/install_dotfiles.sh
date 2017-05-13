#! /bin/bash

set -euo pipefail

main() {
    git clone git@github.com:mwhittaker/dotfiles
    cd dotfiles
    yes | ./install.sh
}

main
