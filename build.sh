#!/bin/bash

curl -O https://dl.google.com/android/repository/android-ndk-r27c-linux.zip > /dev/null
unzip android-ndk-r27c-linux > /dev/null
export ANDROID_NDK=$HOME/android-ndk-r27c-linux
mkdir -p build/realeses/armeabi-v7a
cmake -H. \
-B./build/realeses/armeabi-v7a \
-DANDROID_ABI=armeabi-v7a \
-DANDROID_PLATFORM=android-30 \
-DANDROID_NDK=$ANDROID_NDK \
-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake

make ./build/realeses/armeabi-v7a
