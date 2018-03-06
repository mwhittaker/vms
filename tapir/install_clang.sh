#! /usr/bin/env bash

set -euo pipefail

main() {
    # This won't install the latest version of clang, but TAPIR doesn't need it.
    local -r version=3.9
    sudo apt-get install -y \
        "clang-${version}" \
        "clang-format-${version}" \
        "clang-tidy-${version}" \
        "lldb-${version}" \

    sudo ln -s "$(which clang-${version})" /usr/bin/clang
    sudo ln -s "$(which clang++-${version})" /usr/bin/clang++
    sudo ln -s "$(which clang-format-${version})" /usr/bin/clang-format
    sudo ln -s "$(which clang-tidy-${version})" /usr/bin/clang-tidy
    sudo ln -s "$(which lldb-${version})" /usr/bin/lldb
    sudo ln -s "$(which lldb-server-${version})" /usr/bin/lldb-server
}

main
