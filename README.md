# Gradle build for LatinIME (Android Keyboard)

Develop LatinIME in Android Studio without a need to download and build whole AOSP.

Currently building LatinIME requires downloading and building whole Android sources.
This requires tens of gigabytes of disk space and takes couple hours to complete.
The aim of this project is to allow development of LatingIME using Android Studio, Android SDK and NDK.

## How to build LatinIME APK

1. Make sure you have Android ndk installed and `ANDROID_NDK_HOME` environment variable set.
1. Checkout this repository.
1. Clone LatinIME sources to `LatinIME` subdirectory: (tested and confirmed working on `587c17241a6750e346280cbb08b24a1abea4dc4d`)

        git clone https://android.googlesource.com/platform/packages/inputmethods/LatinIME
1. Configure the build by compiling the native libraries:

        ./configure.sh
1. Import project into Android Studio
1. Try building and installing onto the device via Android Studio.
1. If needed, remove `LatinIME/java/res/values/strings-emoji-descriptions.xml` (or fix encoding of the comments)

Enjoy your new Android Keyboard!
