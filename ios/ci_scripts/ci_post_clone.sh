#!/bin/sh

# fail if any command fails
set -e
# debug log
set -x

# by default, the execution directory of this script is the ci_scripts 
# CI_WORKSPACE is the directory of your cloned repo
echo "✔ Navigate from ($PWD) to ($CI_WORKSPACE)"
cd $CI_WORKSPACE

echo "✔ Install Flutter"
git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"
echo "✔ Set FLUTTER_GIT_URL "
export FLUTTER_GIT_URL="ssh://git@github.com/flutter/flutter.git"

echo "✔ Flutter Precache"
time flutter precache --ios

echo "🟩 Switching to channel beta"
time flutter channel beta
time flutter upgrade

echo "🟩 Install Flutter Dependencies"
time flutter pub get

echo "🟩 Generate json related files"
time flutter pub run build_runner build --delete-conflicting-files

echo "🟩 Install CocoaPods via Homebrew"
time HOMEBREW_NO_AUTO_UPDATE=1 brew install cocoapods

echo "🟩 Install CocoaPods dependencies..."
time cd ios
time pod deintegrate
time pod install 

exit 0
