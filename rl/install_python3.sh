#! /bin/bash

set -euo pipefail

main() {
    # Install dependencies.
    sudo apt-get install -y zlib1g-dev libbz2-dev libreadline-dev libssl-dev

    # Install pyenv
    curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
    echo 'export PATH="/home/vagrant/.pyenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
    PATH="$HOME/.pyenv/bin:$PATH"
    pyenv init -
    pyenv virtualenv-init -

    # Install python 3.
    pyenv install --verbose 3.6.1
    pyenv global 3.6.1
}

main
