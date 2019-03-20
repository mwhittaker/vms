#! /usr/bin/env bash

set -euo pipefail

main() {
    mkdir -p "$HOME/install"
    cd "$HOME/install"

    # Install Eclipse Oxygen, the version needed for eclim.
    local -r eclipse_tar="eclipse-java-oxygen-3a-linux-gtk-x86_64.tar.gz"
    wget "http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/oxygen/3a/${eclipse_tar}"
    tar -xzvf "${eclipse_tar}"
    echo 'export ECLIPSE_HOME="$HOME/install/eclipse"' >> ~/.bash_path
    echo 'export PATH="$ECLIPSE_HOME:$PATH"'   >> ~/.bash_path

    # Install eclim. See http://eclim.org/install.html for more information.
    local -r eclim_version="2.7.2"
    wget "https://github.com/ervandew/eclim/releases/download/${eclim_version}/eclim_${eclim_version}.bin"
    chmod 755 "eclim_${eclim_version}.bin"
    ./eclim_2.7.2.bin \
        --yes \
        --eclipse="$HOME/install/eclipse" \
        --vimfiles="$HOME/.vim" \
        --plugins=jdt,sdt
}

main "$@"
