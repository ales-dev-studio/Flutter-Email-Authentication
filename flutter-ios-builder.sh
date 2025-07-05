#!/bin/bash

flutter clean

export PUB_HOSTED_URL=https://pub-web.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

flutter pub get

flutter build ipa --release --export-method=ad-hoc

open /Users/pickopack/StudioProjects/zarinplus/build/ios/ipa
