#! /bin/bash

set -euo pipefail

main() {
    # system dependencies
    sudo apt-get install -y \
        g++ \
        libssl-dev \
        libreadline-dev \
        zlib1g-dev \
        autoconf \
        bison \
        libgdbm-dev

    # rb-env
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    cd ~/.rbenv && src/configure && make -C src
    cd ~
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_path
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    ~/.rbenv/bin/rbenv init || true # this command always fails for some reason

    # ruby-build
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

    # ruby
    ~/.rbenv/bin/rbenv install -v 2.4.0
    ~/.rbenv/bin/rbenv global 2.4.0

    # Delete the old ruby once we have a new ruby.
    sudo apt-get remove -y ruby
}

main
