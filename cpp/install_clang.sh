#! /bin/bash

# Some useful links:
# - http://clang.llvm.org/get_started.html
# - http://apt.llvm.org/
# - http://askubuntu.com/questions/787383/how-to-install-llvm-3-9
# - https://omtcyfz.github.io/2016/08/30/Improving-workflow-by-using-Clang-based-tools.html

set -euo pipefail

main() {
    sudo bash -c "echo '' >> /etc/apt/sources.list"
    sudo bash -c "echo '# http://apt.llvm.org/' >> /etc/apt/sources.list"
    sudo bash -c "echo 'deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty-4.0 main' >> /etc/apt/sources.list"
    sudo bash -c "echo 'deb-src http://apt.llvm.org/trusty/ llvm-toolchain-trusty-4.0 main' >> /etc/apt/sources.list"
    wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
    sudo apt-get -y update
    sudo apt-get -y upgrade

    sudo apt-get install -y \
        clang-4.0 clang-format-4.0 clang-tidy-4.0 lldb-4.0
    sudo ln -s "$(which clang-4.0)" /usr/bin/clang
    sudo ln -s "$(which clang++-4.0)" /usr/bin/clang++
    sudo ln -s "$(which clang-format-4.0)" /usr/bin/clang-format
    sudo ln -s "$(which clang-tidy-4.0)" /usr/bin/clang-tidy
    sudo ln -s "$(which lldb-4.0)" /usr/bin/lldb
    sudo ln -s "$(which lldb-server-4.0)" /usr/bin/lldb-server
}

main
