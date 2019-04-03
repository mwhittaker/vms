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

    # TODO(mwhittaker): Install perf.

    # Install FlameGraph.
    git clone git@github.com:brendangregg/FlameGraph.git
    echo 'export PATH="$HOME/install/FlameGraph:$PATH"' >> ~/.bash_path

    # Install perf-map-agent
    sudo apt-get install -y cmake g++
    git clone git@github.com:jvm-profiling-tools/perf-map-agent.git
    (cd perf-map-agent && cmake . && make)
    echo 'export PATH="$HOME/install/perf-map-agent/bin:$PATH"' >> ~/.bash_path

    # Install FlameScope.
    git clone git@github.com:Netflix/flamescope.git
}

main
