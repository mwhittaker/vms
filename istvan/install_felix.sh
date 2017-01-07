#! /bin/bash

# Links:
#  - https://github.com/frenetic-lang/frenetic/tree/verification_and_felix
#  - https://github.com/frenetic-lang/frenetic-vm
#  - https://github.com/frenetic-lang/netkat-automata

set -euo pipefail

main() {
    sudo apt-get install -y g++ autoconf debianutils zlib1g-dev
    git clone git@github.com:frenetic-lang/frenetic.git --branch verification_and_felix
    opam pin add frenetic frenetic -n -k git
    opam install -y async_extended frenetic

    # cd frenetic
    # make
    # ./frenetic.native shell
    # felix <in> <p> <t> <out> <q>
}

main
