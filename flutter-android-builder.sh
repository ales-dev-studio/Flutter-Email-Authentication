#!/bin/bash

app="App name"
version=$(grep "version" "pubspec.yaml" | cut -d ' ' -f 2)
versionNumber=$(echo "$version" | cut -d '+' -f 1)
buildNumber=$(echo "$version" | cut -d '+' -f 2)

flutter clean

export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"

flutter pub get

flutter build apk --target-platform android-arm,android-arm64 --release

cd build/app/outputs/apk
