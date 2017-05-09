#! /usr/bin/env bash

set -euo pipefail

main() {
    readonly JAVA_VERSION=131
    readonly JAVA_B=11
    readonly JAVA_HASH="d54c1d3a095b4ff2b6607d096fa80163"

    # Dependencies.
    sudo apt-get install -y libswt-gtk-3-java unzip

    # JDK (http://stackoverflow.com/a/10959815/3187068).
    wget \
        --no-check-certificate \
        --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        "http://download.oracle.com/otn-pub/java/jdk/8u${JAVA_VERSION}-b${JAVA_B}/${JAVA_HASH}/jdk-8u${JAVA_VERSION}-linux-x64.tar.gz"
    tar -xzvf jdk-8u${JAVA_VERSION}-linux-x64.tar.gz
    echo 'export JAVA_HOME="$HOME/jdk1.8.0_'${JAVA_VERSION}'"' >> ~/.bash_path
    echo 'export PATH="$JAVA_HOME/bin:$PATH"'                  >> ~/.bash_path

    # eclipse.
    readonly ECLIPSE_TAR="eclipse-java-neon-3-linux-gtk-x86_64.tar.gz"
    wget "http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/neon/3/${ECLIPSE_TAR}"
    tar -xzvf "${ECLIPSE_TAR}"
    echo 'export ECLIPSE_HOME="$HOME/eclipse"' >> ~/.bash_path
    echo 'export PATH="$ECLIPSE_HOME:$PATH"'   >> ~/.bash_path

    # eclim.
    readonly ECLIM_VERSION="2.6.0"
    wget "https://github.com/ervandew/eclim/releases/download/${ECLIM_VERSION}/eclim_${ECLIM_VERSION}.jar"
    JAVA_HOME="${HOME}/jdk1.8.0_${JAVA_VERSION}" \
    PATH="${JAVA_HOME}/bin:${PATH}" \
    jdk1.8.0_${JAVA_VERSION}/bin/java \
        -Dvim.files=/home/vagrant/.vim \
        -Declipse.home=/home/vagrant/eclipse \
        -jar "eclim_${ECLIM_VERSION}.jar" install

    # maven
    wget 'http://www-us.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.zip'
    unzip apache-maven-3.5.0-bin.zip
    echo 'export MAVEN_HOME="$HOME/apache-maven-3.5.0"' >> ~/.bash_path
    echo 'export PATH="$MAVEN_HOME/bin:$PATH"'          >> ~/.bash_path
}

main
