#! /usr/bin/env bash

set -euo pipefail

main() {
    sudo apt-get install unzip
    mkdir -p ~/.mujoco
    cd ~/.mujoco
    wget 'https://www.roboti.us/download/mjpro131_linux.zip'
    unzip mjpro131_linux.zip
    echo 'Copy mjkey.txt into ~/.mujoco!'
}

main
