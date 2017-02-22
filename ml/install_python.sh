#! /bin/bash

set -euo pipefail

main() {
    # Install dependencies.
    #   - python-dev is needed for ipython
    #   - python-tk is needed for matplotlib
    #   - pylint is wildly helpful
    sudo apt-get install python-dev python-tk pylint

    # Install pip.
    wget 'https://bootstrap.pypa.io/get-pip.py'
    sudo python get-pip.py

    # Install global packages. These packages are useful for development but
    # are not needed to run submitted code. Any package needed to run submitted
    # code should be installed in a virtualenv in the same directory as the
    # submission.
    #
    # For example, matplotlib is used to create plots for the writeup, but the
    # TAs don't need to run the plot generating code. Thus, it is a global
    # package. Numpy on the other hand is needed to run the code, so it would
    # be put in a virtualenv.
    sudo pip install virtualenv ipython matplotlib
}

main
