#! /bin/bash

set -euo pipefail

main() {
    # system dependencies
    sudo apt-get remove -y ruby
    sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev autoconf bison

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
    rbenv install -v 2.3.0-dev
}

main
