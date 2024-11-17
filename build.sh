#!/bin/bash

curl -O https://dl.google.com/android/repository/android-ndk-r27c-linux.zip > /dev/null
unzip android-ndk-r27c-linux > /dev/null
export ANDROID_NDK=$HOME/android-ndk-r27c-linux
curl -O https://github.com/Kitware/CMake/releases/download/v3.31.0/cmake-3.31.0-linux-x86_64.sh > /dev/null
bash cmake-3.31.0-linux-x86_64.sh > /dev/null
cmake --version
