#! /bin/bash

set -euo pipefail

main() {
    cd
    if [[ ! -d dotfiles ]]; then
        git clone git@github.com:mwhittaker/dotfiles
        cd dotfiles
        yes | ./install.sh
    fi
}

main
