#!/bin/bash

set -eo pipefail

FLUTTER_VERSION="3.7.0-1.5.pre"
FLUTTER_GIT_URL="https://github.com/flutter/flutter.git"

echo "✔ Navigate from ($PWD) to ($CI_WORKSPACE)"
cd $CI_WORKSPACE

# Set up directories
FLUTTER_DIR="$HOME/flutter"
mkdir -p "$FLUTTER_DIR"

# Download Flutter using git
echo "Cloning Flutter $FLUTTER_VERSION..."
time git clone --depth 1 --branch $FLUTTER_VERSION $FLUTTER_GIT_URL "$FLUTTER_DIR/flutter"

# Set up environment variables
export PATH="$PATH:$FLUTTER_DIR/flutter/bin"

# Set the Flutter Git url env variable
echo "Set FLUTTER_GIT_URL"
export FLUTTER_GIT_URL="http://github.com/flutter/flutter.git"

# Install CocoaPods
echo "Installing CocoaPods..."
export HOMEBREW_NO_ENV_HINTS=1
time HOMEBREW_NO_AUTO_UPDATE=1 brew install cocoapods

# Run Flutter doctor to verify installation
echo "Running Flutter doctor..."
time flutter doctor

# Run flutter pub get
echo "Running flutter pub get..."
time flutter pub get

# Generate code for serialization, deserialization, and dependency injection using the build_runner package
echo " Genereting files for serialization, deserialization and dependency injections..."
time flutter pub run build_runner build --delete-conflicting-outputs


# Run pod install
echo "Running pod install..."
cd ios/
pod install
cd ..

echo "Setup complete!"
