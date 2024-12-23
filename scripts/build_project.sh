#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
BUILD_DIR="$SCRIPT_DIR/../build"

# Check if the build directory exists
if [ ! -d "$BUILD_DIR" ]; then
    echo "Error: The build directory '$BUILD_DIR' does not exist."
    exit 1
fi

cd "$BUILD_DIR"

# Build the project
cmake --build .

if [ $? -eq 0 ]; then
    echo "Build successful."
else
    echo "Error: Build failed."
    exit 1
fi
