#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

BUILD_DIR="$SCRIPT_DIR/../build"
GENERATOR=${1:-"Unix Makefiles"}

if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    if ! where cmake > /dev/null 2>&1; then
        echo "Error: CMake not installed."
        exit 1
    fi
else
    if ! command -v cmake &> /dev/null; then
        echo "Error: CMake not installed."
        exit 1
    fi
fi

[ ! -d "$BUILD_DIR" ] && mkdir "$BUILD_DIR"
cd "$BUILD_DIR"

cmake -G "$GENERATOR" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..

if [ $? -eq 0 ]; then
    # Move Compile commands to project root.
    mv compile_commands.json ../
    echo "CMake successful. files generated in $BUILD_DIR."
    echo "for comilation execute, $BUILD_DIR && cmake --build ."
else
    echo "Error: Failed generating."
    exit 1
fi
