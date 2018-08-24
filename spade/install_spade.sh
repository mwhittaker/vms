#! /bin/bash

set -euo pipefail

main() {
    # https://github.com/ashish-gehani/SPADE/wiki/Requirements
    sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt-get -y update
    sudo apt-get install -y oracle-java8-installer
    sudo apt-get install -y \
        auditd fuse git libaudit-dev libfuse-dev linux-headers-`uname -r` \
        lsof pkg-config uthash-dev

    # https://github.com/ashish-gehani/SPADE/wiki/Downloading-and-compiling
    git clone https://github.com/mwhittaker/SPADE.git
    cd SPADE
    ./configure
    make

    # https://github.com/ashish-gehani/SPADE/wiki/Collecting-system-wide-provenance-on-Linux
    sudo chmod ug+s `which auditctl`
    sudo chmod ug+s `which iptables`
    sudo chown root /home/vagrant/SPADE/lib/spadeAuditBridge
    sudo chmod ug+s /home/vagrant/SPADE/lib/spadeAuditBridge
    sudo sed -i 's/active = no/active = yes/' /etc/audisp/plugins.d/af_unix.conf
    sudo service auditd restart

    # https://github.com/ashish-gehani/SPADE/wiki/Adding-provenance-instrumentation-during-compilation
    sudo apt-get install -y clang-3.6 clang-3.6-dev llvm-3.6 llvm-3.6-dev llvm-3.6-runtime
    sudo ln -s $(which clang-3.6) /usr/bin/clang
    sudo ln -s $(which clang++-3.6) /usr/bin/clang++
    sudo ln -s $(which llvm-link-3.6) /usr/bin/llvm-link
    sudo ln -s $(which llc-3.6) /usr/bin/llc
    sudo ln -s $(which opt-3.6) /usr/bin/opt
    sudo apt-get install -y python-pip
    sudo pip install wllvm
    make LLVM_INCLUDE_PATH="/usr/lib/llvm-3.6/include" build-linux-llvm
}

main
