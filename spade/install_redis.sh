#! /bin/bash

set -euo pipefail

main() {
    wget 'http://download.redis.io/releases/redis-4.0.9.tar.gz'
    tar -xzvf redis-4.0.9.tar.gz
    cd redis-4.0.9
    LLVM_COMPILER=clang CC=wllvm make

    cd src
    extract-bc redis-server
    PATH="$PATH:/usr/lib/llvm-3.6/bin" ~/SPADE/bin/llvm/llvmTrace.sh \
        redis-server \
        -monitor-all \
        redis-server-traced \
        "$HOME/redis-4.0.9/deps/hiredis/libhiredis.a $HOME/redis-4.0.9/deps/jemalloc/lib/libjemalloc.a $HOME/redis-4.0.9/deps/lua/src/liblua.a -ldl -pthread"
}

main
