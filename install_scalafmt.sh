#! /usr/bin/env bash

set -euo pipefail

main() {
    mkdir -p "$HOME/install"
    cd "$HOME/install"

    # Install coursier, the tool needed to install scalafmt. See
    # https://github.com/coursier/coursier for installation instructions.
    curl -L -o coursier https://git.io/vgvpD
    chmod +x coursier

    # We want to install the nailgun version of scalafmt. In order to do so, we
    # have to install nailgun. To install nailgun, we need maven.
    wget 'http://mirror.metrocast.net/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz'
    tar -xzvf apache-maven-3.6.0-bin.tar.gz
    echo 'export PATH="$PATH:$HOME/install/apache-maven-3.6.0/bin"' >> ~/.bash_path

    # Next, we install nailgun. If you clone the nailgun repository, it builds
    # just fine. However, if you try to use this version of nailgun with
    # scalafmt [1], it doesn't actually work [2]. In [2], they suggest building
    # the nailgun-all-0.9.1 tag.  But, this tag doesn't build because of
    # javadoc errors. Thus, we clone a fork of the repo with these errors
    # fixed.
    #
    # [1]: https://scalameta.org/scalafmt/#Nailgun
    # [2]: scalameta/scalafmt#1115
    git clone https://github.com/mwhittaker/nailgun.git \
        --branch nailgun-all-0.9.1-fix
    cd nailgun
    ../apache-maven-3.6.0/bin/mvn clean install
    make
    sudo make install
    cd ..

    # Finally, we Install the nailgun version of scalafmt. See [1] for
    # installation instructions. See [2] for instructions on how to run
    # scalafmt with nailgun.
    #
    # [1]: https://scalameta.org/scalafmt/
    # [2]: https://scalameta.org/scalafmt/docs/installation.html#nailgun
    ./coursier bootstrap \
        --standalone com.geirsson:scalafmt-cli_2.12:1.6.0-RC3 \
        -r bintray:scalameta/maven \
        -o "$PWD/scalafmt_ng" \
        -f \
        --main com.martiansoftware.nailgun.NGServer
    echo 'export PATH="$PATH:$HOME/install"' >> ~/.bash_path
}

main "$@"
