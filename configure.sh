#!/bin/bash
set -e

if [ ! -d "LatinIME" ]; then
    echo "Please download latest LatinIME to the LatinIME directory."
    echo "git clone https://android.googlesource.com/platform/packages/inputmethods/LatinIME"
    exit 1
fi

if [ -z "$ANDROID_NDK_HOME" ]; then
    echo "Please define ANDROID_NDK_HOME"
    exit 2
fi

# Copy all ndk_build makefiles to the jni directory.
cp native_makefiles/*.mk LatinIME/native/jni/

# Build libjni_latinime.so.
pushd LatinIME/native/jni/
$ANDROID_NDK_HOME/ndk-build -j || true
popd

# Copy all native libraries to the app module.
rm -r app/src/main/jniLibs || true
mkdir -p app/src/main/jniLibs
cp -r LatinIME/native/libs/ app/src/main/jniLibs/
