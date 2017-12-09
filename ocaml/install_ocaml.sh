#! /bin/bash

# Links:
#  - https://opam.ocaml.org/doc/Install.html
#  - https://github.com/cs3110/vm

set -euo pipefail

boxed() {
    msg="* $1 *"
    echo "$msg" | sed 's/./*/g'
    echo "$msg"
    echo "$msg" | sed 's/./*/g'
}

main() {
    sudo apt-get install -y aspcud m4 unzip pkg-config
    wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh
    # This returns a non-zero exit code sometimes, even though it succeeds.
    (yes | sh opam_installer.sh /usr/local/bin 4.06.0) || true
    opam update
    opam upgrade
    opam install -y ocamlbuild utop merlin
    boxed 'Run "eval `opam config env` or open a new terminal."'
    boxed 'Run "opam install -y core async" to install core and async.'
}

main
