#! /usr/bin/env bash

set -euo pipefail

main() {
    readonly JAVA_VERSION=79
    readonly JAVA_B=15

    # Dependencies.
    sudo apt-get install -y libswt-gtk-3-java

    # JDK (http://stackoverflow.com/a/10959815/3187068)
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u${JAVA_VERSION}-b${JAVA_B}/jdk-7u${JAVA_VERSION}-linux-x64.tar.gz"
    tar -xzvf "jdk-7u${JAVA_VERSION}-linux-x64.tar.gz"
    echo 'export JAVA_HOME="$HOME/jdk1.7.0_'${JAVA_VERSION}'"' >> ~/.bash_path
    echo 'export PATH="$JAVA_HOME/bin:$PATH"'                  >> ~/.bash_path
fi

    # eclipse.
    # TODO: This is broken.
    readonly ECLIPSE_TAR="eclipse-inst-linux64.tar.gz"
    wget "http://eclipse.mirror.rafal.ca/oomph/epp/neon/R3/${ECLIPSE_TAR}"
    tar -xzvf "${ECLIPSE_TAR}"
    echo 'export ECLIPSE_HOME="$HOME/eclipse"' >> ~/.bash_path
    echo 'export PATH="$ECLIPSE_HOME:$PATH"'   >> ~/.bash_path

    # eclim.
    readonly ECLIM_VERSION="2.6.0"
    wget "https://github.com/ervandew/eclim/releases/download/${ECLIM_VERSION}/eclim_${ECLIM_VERSION}.jar"
    JAVA_HOME="${HOME}/jdk1.7.0_${JAVA_VERSION}" \
    PATH="${JAVA_HOME}/bin:${PATH}" \
    jdk1.7.0_${JAVA_VERSION}/bin/java \
        -Dvim.files=/home/vagrant/.vim \
        -Declipse.home=/home/vagrant/eclipse \
        -jar "eclim_${ECLIM_VERSION}.jar" install

    # # maven
    # wget 'http://mirrors.advancedhosters.com/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz'
    # tar -xzvf apache-maven-3.3.3-bin.tar.gz
    # echo 'export MAVEN_HOME="$HOME/apache-maven-3.3.3"' >> ~/.bash_path
    # echo 'export PATH="$MAVEN_HOME/bin:$PATH"'          >> ~/.bash_path
}

main
