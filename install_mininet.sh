#! /bin/bash

set -euo pipefail

main() {
    sudo apt-get install -y python-setuptools

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

    echo 'export PYTHONPATH="/usr/local/lib/python2.7/dist-packages/mininet-2.3.0d4-py2.7.egg:$PYTHONPATH"' >> ~/.bash_path
}

main
