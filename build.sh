#!/bin/bash

curl -O https://dl.google.com/android/repository/android-ndk-r27c-linux.zip 
unzip android-ndk-r27c-linux
export ANDROID_NDK=$HOME/android-ndk-r27c-linux
curl -O https://github.com/Kitware/CMake/releases/download/v3.31.0/cmake-3.31.0-linux-x86_64.sh
bash cmake-3.31.0-linux-x86_64.sh 
sudo apt-get update && sudo apt-get install -y build-essential 
mkdir -p build/realeses/armeabi-v7a
ls $ANDROIR_NDK
ls $ANDROID_NDK/build
ls $ANDROID_NDK/build/cmake
ls build/realeses/armeabi-v7a
cmake -H. \
-B./build/realeses/armeabi-v7a \
-DANDROID_ABI=armeabi-v7a \
-DANDROID_PLATFORM=android-30 \
-DANDROID_NDK=$ANDROID_NDK \
-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake
make ./build/realeses/armeabi-v7a
