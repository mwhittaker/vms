#! /bin/bash

# Links:
#  - https://opam.ocaml.org/doc/Install.html
#  - https://github.com/cs3110/vm

set -euo pipefail

main() {
    sudo apt-get install -y aspcud m4 unzip pkg-config
    wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh
    yes | sh opam_installer.sh /usr/local/bin 4.03.0
    opam init -a -y
    opam update
    opam upgrade
    opam install -y ocamlbuild utop merlin
    # eval `opam config env`
}

main
