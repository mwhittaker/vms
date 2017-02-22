#! /bin/bash

set -euo pipefail

main() {
    wget 'http://download.redis.io/releases/redis-3.2.8.tar.gz'
    tar -xzvf redis-3.2.8.tar.gz
    cd redis-3.2.8
    make

    # In order to run redis, you'll need to put the src directory in your path.
    # Here, we assume you source the ~/.bash_path file in your ~/.bashrc.
    echo 'export PATH="$PATH:$HOME/redis-3.2.8/src"' >> ~/.bash_path
}

main
