#! /usr/bin/env bash

# This script installs everything needed to generate flame graphs for Java
# programs [1, 2].
#
# [1]: http://www.brendangregg.com/blog/2014-06-12/java-flame-graphs.html
# [2]: https://medium.com/netflix-techblog/java-in-flames-e763b3d32166

set -euo pipefail

main() {
    mkdir -p "$HOME/install"
    cd "$HOME/install"

    # Install perf.
    sudo apt-get install -y linux-tools-common

    # Install FlameGraph.
    if [[ ! -d FlameGraph ]]; then
        git clone git@github.com:brendangregg/FlameGraph.git
    fi

    local s='export PATH="$HOME/install/FlameGraph:$PATH"'
    if ! grep "$s" ~/.bash_path &> /dev/null; then
        echo "$s" >> ~/.bash_path
    fi

    # Install perf-map-agent
    sudo apt-get install -y cmake g++
    if [[ ! -d perf-map-agent ]]; then
        git clone git@github.com:jvm-profiling-tools/perf-map-agent.git
        (cd perf-map-agent && cmake . && make)
    fi

    local s='export PATH="$HOME/install/perf-map-agent/bin:$PATH"'
    if ! grep "$s" ~/.bash_path &> /dev/null; then
        echo "$s">> ~/.bash_path
    fi

    # Install FlameScope.
    if [[ ! -d flamescope ]]; then
        git clone git@github.com:Netflix/flamescope.git
    fi
}

main
