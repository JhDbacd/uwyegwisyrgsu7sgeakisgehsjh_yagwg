#!/bin/bash

echo $PWD
curl -O https://dl.google.com/android/repository/android-ndk-r27c-linux.zip > /dev/null
unzip android-ndk-r27c-linux > /dev/null
export ANDROID_NDK=./android-ndk-r27c
curl -O https://github.com/Kitware/CMake/releases/download/v3.31.0/cmake-3.31.0-linux-x86_64.sh > /dev/null
bash cmake-3.31.0-linux-x86_64.sh > /dev/null
sudo apt-get update && sudo apt-get install -y build-essential 
mkdir -p build/realeses/armeabi-v7a
ls $ANDROIR_NDK
cmake -H. \
-B./build/realeses/armeabi-v7a \
-DANDROID_ABI=armeabi-v7a \
-DANDROID_PLATFORM=android-30 \
-DANDROID_NDK=$ANDROID_NDK \
-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake
cd build/realeses/armeabi-v7a
make clean
make 
ls 
