#!/bin/bash

curl -O https://dl.google.com/android/repository/android-ndk-r27c-linux.zip
unzip android-ndk-r27c-linux
export ANDROID_NDK=$HOME/android-ndk-r27c-linux
curl -O https://github.com/Kitware/CMake/releases/download/v3.31.0/cmake-3.31.0-linux-x86_64.sh
bash cmake-3.31.0-linux-x86_64.sh
ls
echo "Sucesso!"
