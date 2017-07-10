#! /usr/bin/env bash

set -euo pipefail

main() {
    local readonly version="3.11.0"
    local readonly archive="apache-cassandra-${version}-bin.tar.gz"
    wget "http://supergsego.com/apache/cassandra/${version}/${archive}"
    tar -xvf "$archive"
}

main
