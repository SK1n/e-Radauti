#!/bin/sh

# fail if any command fails
set -e
# debug log
set -x

# by default, the execution directory of this script is the ci_scripts 
# CI_WORKSPACE is the directory of your cloned repo
echo "✔ Navigate from ($PWD) to ($CI_WORKSPACE)"
cd $CI_WORKSPACE

echo "✔ Install Flutter 3.7.0-1.5.pre"

cd $HOME

echo "Download flutter"

time curl https://storage.googleapis.com/flutter_infra_release/releases/beta/macos/flutter_macos_3.7.0-1.5.pre-beta.zip

echo "unzip flutter"

time unzip $HOME/flutter_macos_3.7.0-1.5.pre-beta.zip

export PATH="$PATH:$HOME/flutter/bin"
echo "✔ Set FLUTTER_GIT_URL "
export FLUTTER_GIT_URL="http://github.com/flutter/flutter.git"

echo "✔ Flutter Precache"
time flutter precache --ios
cd $CI_WORKSPACE

echo "🟩 Switching to channel beta"
time flutter channel beta
time flutter upgrade
time flutter downgrade 3.7.3
time flutter --version

echo "🟩 Install Flutter Dependencies"
time flutter pub get

echo "🟩 Generate json related files"
time flutter pub run build_runner build --delete-conflicting-outputs

echo "🟩 Install CocoaPods via Homebrew"
time HOMEBREW_NO_AUTO_UPDATE=1 brew install cocoapods

echo "🟩 Install CocoaPods dependencies..."
time cd ios
time pod deintegrate
time pod install 

exit 0
