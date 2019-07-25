#! /usr/bin/env bash

set -euo pipefail

main() {
    mkdir -p "$HOME/install"
    cd "$HOME/install"

    # See [1] for instructions on how to install various versions of Java from
    # the command line. The tricky bit is setting up the cookies to accept
    # Oracle's license. [1] is sometimes out of data and doesn't include
    # instructions to install the latest version of Java 8. In this case,
    # navigate to [2] and find the URL for the most recent version of Java 8 to
    # update the variables below.
    #
    # [1]: https://stackoverflow.com/a/10959815/3187068
    # [2]: http://www.oracle.com/technetwork/java/javase/downloads/index.html
    if [[ ! -f jdk-8u131-linux-x64.tar.gz ]]; then
        wget \
            -c \
            --header "Cookie: oraclelicense=accept-securebackup-cookie" \
            http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
    fi

    if [[ ! -d jdk1.8.0_131 ]]; then
        tar -xzvf jdk-8u131-linux-x64.tar.gz
    fi

    local s='export JAVA_HOME="$HOME/install/jdk1.8.0_131"'
    if ! grep "$s" ~/.bash_path &> /dev/null; then
        echo $s >> ~/.bash_path
    fi

    local s='export PATH="$JAVA_HOME/bin:$PATH"'
    if ! grep "$s" ~/.bash_path &> /dev/null; then
        echo $s >> ~/.bash_path
    fi
}

main "$@"
