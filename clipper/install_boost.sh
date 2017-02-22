#! /bin/bash

set -euo pipefail

main() {
    local readonly version=1.60.0
    local readonly underscore_version=1_60_0
    wget "https://sourceforge.net/projects/boost/files/boost/${version}/boost_${underscore_version}.tar.gz"
    tar -xzf "boost_${underscore_version}.tar.gz"
    cd "boost_${underscore_version}"
    libraries="thread,system,chrono,date_time,atomic,serialization" # See [1]
    ./bootstrap.sh --with-toolset=clang --with-libraries="$libraries"
    sudo ./b2 install

    # [1]: https://github.com/ucbrise/clipper/blob/910d1a31c911018203e4d1926d68659684ad9d6b/CMakeLists.txt#L16
}

main
