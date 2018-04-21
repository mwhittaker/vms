#! /bin/bash

set -euo pipefail

boxed() {
    local -r msg="* $1 *"
    echo "$msg" | sed 's/./*/g'
    echo "$msg"
    echo "$msg" | sed 's/./*/g'
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
    jxvf criu-1.6.tar.bz2
    make
    echo ubuntu | sudo -S make install
    which criu
}

main() {
    boxed "Inside LXC container u1."

    # Install the basics.
    echo ubuntu | sudo -S apt-get install -y bc git tmux

    clone_dotfiles
    clone_repo
    setup_bash_path
    install_criu
}

main
