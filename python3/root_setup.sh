#! /usr/bin/env bash

set -euo pipefail

main() {
    apt-get update
    apt-get install -y git tmux vim
    sudo timedatectl set-timezone America/Los_Angeles
}

main
