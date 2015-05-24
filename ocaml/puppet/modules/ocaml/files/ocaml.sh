#! /bin/sh

wget https://raw.githubusercontent.com/ocaml/opam/master/shell/opam_installer.sh
sudo bash opam_installer.sh /usr/local/bin
opam init --comp 4.02.1 -y
