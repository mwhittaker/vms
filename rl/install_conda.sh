#! /usr/bin/env bash

set -euo pipefail

main() {
    wget 'https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh'
    bash Anaconda3-4.3.1-Linux-x86_64.sh -b
    echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bash_path
}

main
