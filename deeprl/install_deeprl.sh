#! /usr/bin/env bash

set -euo pipefail

main() {
    # Install dependencies See [1] for dependency information.
    # [1]: https://github.com/openai/mujoco-py/blob/master/Dockerfile
    sudo apt-get install \
        cmake \
        curl \
        g++ \
        gfortran \
        libatlas-dev \
        libblas-dev \
        libgl1-mesa-dev \
        libgl1-mesa-glx \
        libglew-dev \
        libglu1-mesa \
        libjpeg-dev \
        libjpeg62 \
        libjpeg62-dev \
        liblapack-dev \
        libosmesa6-dev \
        libxcursor1 \
        libxinerama1 \
        net-tools \
        unzip \
        wget \
        libav-tools \
        xorg-dev \
        xpra \
        xserver-xorg-dev \
        xvfb \
        zlib1g-dev

    # Install tensorflow (https://www.tensorflow.org/install/install_linux#InstallingAnaconda).
    pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.3.0-cp35-cp35m-linux_x86_64.whl

    # Install OpenAI gym.
    pip install --upgrade gym

    # Install mujoco-py.
    pip install --verbose --upgrade mujoco-py==0.5.7

    # Install misc.
    pip install scipy seaborn opencv-python 'gym[atari]'
}

main
