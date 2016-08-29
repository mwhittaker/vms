#! /bin/bash

set -euo pipefail

main() {
    # rb-env
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    cd ~/.rbenv && src/configure && make -C src
    cd ~
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_path
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    ~/.rbenv/bin/rbenv init

    # ruby-build
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

    # ruby
    apt-get install -y libssl-dev libreadline-dev zlib1g-dev autoconf
    rbenv install -v 2.3.1
}

main
