#! /bin/bash

set -euo pipefail

main() {
    mkdir -p "$HOME/install"
    cd "$HOME/install"

    # See [1] for installation instructions.
    #
    # [1]: http://mininet.org/download/
    git clone git://github.com/mininet/mininet

    # Install everything (-a) into the install directory (-s install).
    ./mininet/util/install.sh -s . -a

    # Make sure everything works!
    sudo mn --test pingall
}

main
