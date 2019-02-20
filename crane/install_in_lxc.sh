#! /bin/bash

set -euo pipefail

boxed() {
    local -r msg="* $1 *"
    echo "$msg" | sed 's/./*/g'
    echo "$msg"
    echo "$msg" | sed 's/./*/g'
}

install_dependencies() {
    boxed "install_dependencies"
    echo ubuntu | sudo -S apt-get install -y \
        autoconf axel bison build-essential curl dejagnu flex git libboost-dev \
        libboost-system-dev libbz2-dev libconfig-dev libdb-dev libevent-dev \
        libsqlite3-dev libxml-libxml-perl libxml2-dev libxslt1-dev m4 mencoder \
        nano php5-cgi psmisc python-dev python-pip python-setuptools \
        subversion sysbench valgrind wget zlib1g-dev
    echo ubuntu | sudo -S pip install numpy OutputCheck
}

clone_dotfiles() {
    boxed "clone_dotfiles"
    git clone https://github.com/mwhittaker/dotfiles
    cd dotfiles
    (yes | ./install.sh) || true
}

clone_repo() {
    boxed "clone_repo"
    if ! [[ -d "$HOME/crane" ]]; then
        cd "$HOME"
        git clone https://github.com/columbia/crane
    fi
}

setup_bash_path() {
    boxed "setup_bash_path"
    export MSMR_ROOT="$HOME/crane"
    export XTERN_ROOT="$MSMR_ROOT/xtern"
    set +u
    export LD_LIBRARY_PATH="$MSMR_ROOT/libevent_paxos/.local/lib:$LD_LIBRARY_PATH"
    set -u

    if ! grep 'MSMR_ROOT' ~/.bash_path; then
        echo 'export MSMR_ROOT="$HOME/crane"' >> ~/.bash_path
    fi
    if ! grep 'XTERN_ROOT' ~/.bash_path; then
        echo 'export XTERN_ROOT="$MSMR_ROOT/xtern"' >> ~/.bash_path
    fi
    if ! grep 'libevent_paxos' ~/.bash_path; then
        echo 'export LD_LIBRARY_PATH="$MSMR_ROOT/libevent_paxos/.local/lib:$LD_LIBRARY_PATH"' >> ~/.bash_path
    fi
}

compile_xtern() {
    boxed "compile_xtern"
    cd $HOME/crane/xtern
    mkdir -p obj
    cd obj
    ../configure --prefix=$XTERN_ROOT/install
    make clean
    make
    make install
}

compile_paxos() {
    boxed "compile_paxos"
    cd $HOME/crane/libevent_paxos
    ./mk
    make clean
    make
}

install_dynamorio() {
    boxed "install_dynamorio"
    sudo apt-get install -y \
        cmake doxygen ghostscript imagemagick subversion transfig
    cd /usr/share/
    if ! [[ -d dynamorio ]]; then
        sudo git clone https://github.com/DynamoRIO/dynamorio.git
    fi
    cd dynamorio
    sudo mkdir -p build
    cd build
    sudo cmake ..
    sudo make
    sudo make drcov
    cd tools
    # sudo ln -s $PWD/../drcov.drrun64 .
    sudo mkdir -p lib64
    cd lib64
    sudo mkdir -p release
    cd release
    sudo ln -sf $PWD/../../../clients/lib64/release/libdrcov.so .
}

install_criu() {
    boxed "install_criu"
    echo ubuntu | sudo -S apt-get install -y \
        bsdmainutils \
        git \
        libprotobuf-c0 \
        libprotobuf-c0-dev \
        libprotobuf-dev \
        libprotoc-dev \
        make \
        pkg-config \
        protobuf-c-compiler \
        protobuf-compiler \
        python \
        wget
    # Installing with recommended packages installs tex which takes a very very
    # long time. Passing --no-install-recommends avoids installing tex.
    echo ubuntu | sudo -S apt-get --no-install-recommends install -y asciidoc xmlto

    cd $HOME/crane/tools
    wget http://download.openvz.org/criu/criu-1.6.tar.bz2
    tar jxvf criu-1.6.tar.bz2
    cd criu-1.6
    make
    echo ubuntu | sudo -S make install
    which criu
}

main() {
    boxed "Inside LXC container u1."
    boxed "$(whoami)"
    boxed "$(hostname)"

    # Install the basics.
    echo ubuntu | sudo -S apt-get install -y bc git tmux

    install_dependencies
    clone_dotfiles
    clone_repo
    setup_bash_path
    compile_xtern
    compile_paxos
    install_dynamorio
    install_criu
}

main
