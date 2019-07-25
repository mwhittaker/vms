#! /usr/bin/env bash

set -euo pipefail

main() {
    mkdir -p "$HOME/install"
    cd "$HOME/install"

    if [[ ! -f 'Anaconda3-4.4.0-Linux-x86_64.sh' ]]; then
        wget 'https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh'
    fi

    if [[ ! -d "$HOME/install/anaconda3" ]]; then
        bash Anaconda3-4.4.0-Linux-x86_64.sh -b -p "$HOME/install/anaconda3"
    fi

    local s='export PATH="$HOME/install/anaconda3/bin:$PATH"'
    if ! grep "$s" ~/.bash_path &> /dev/null; then
        echo "$s" >> ~/.bash_path
    fi

    # Ideally, running `jupyter notebook` from within a conda environment would
    # run the the notebook within the conda environment. By default, this is
    # not the case. To get this behavior, you have to run `conda install
    # nb_conda`. See [1] for details.
    #
    # [1]: https://stackoverflow.com/a/42585283/3187068
    # conda install nb_conda
}

main
