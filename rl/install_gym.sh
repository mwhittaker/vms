#! /usr/bin/env bash

set -euo pipefail

main() {
    # Install dependencies needed for OpenAI gym.
    sudo apt-get install python-opengl libav-tools

    pip install gym
}

main
