#! /usr/bin/env bash

set -euo pipefail

main() {
    # See [1] for instructions on how to install various versions of Java from
    # the command line. The tricky bit is setting up the cookies to accept
    # Oracle's license. [1] is sometimes out of data and doesn't include
    # instructions to install the latest version of Java 8. In this case,
    # navigate to [2] and find the URL for the most recent version of Java 8 to
    # update the variables below.
    #
    # [1]: https://stackoverflow.com/a/10959815/3187068
    # [2]: http://www.oracle.com/technetwork/java/javase/downloads/index.html
    local -r JAVA_VERSION=172
    local -r JAVA_B=11
    local -r JAVA_HASH="a58eab1ec242421181065cdc37240b08"
    wget \
        --no-check-certificate \
        -c \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        "http://download.oracle.com/otn-pub/java/jdk/8u${JAVA_VERSION}-b${JAVA_B}/${JAVA_HASH}/jdk-8u${JAVA_VERSION}-linux-x64.tar.gz"
    tar -xzvf "jdk-8u${JAVA_VERSION}-linux-x64.tar.gz"
    echo 'export JAVA_HOME="$HOME/jdk1.8.0_'${JAVA_VERSION}'"' >> ~/.bash_path
    echo 'export PATH="$JAVA_HOME/bin:$PATH"'                  >> ~/.bash_path

    # eclipse.
    # readonly ECLIPSE_TAR="eclipse-java-oxygen-1-linux-gtk-x86_64.tar.gz"
    # wget "http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/oxygen/1/${ECLIPSE_TAR}"
    # tar -xzvf "${ECLIPSE_TAR}"
    # echo 'export ECLIPSE_HOME="$HOME/eclipse"' >> ~/.bash_path
    # echo 'export PATH="$ECLIPSE_HOME:$PATH"'   >> ~/.bash_path
}

main "$@"
