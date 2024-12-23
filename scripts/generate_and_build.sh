#!/bin/bash

# Path to the generate and build scripts
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
GENERATE_SCRIPT="$SCRIPT_DIR/generate_build.sh"
BUILD_SCRIPT="$SCRIPT_DIR/build_project.sh"

# Check if generate_build.sh exists
if [ ! -f "$GENERATE_SCRIPT" ]; then
    echo "Error: $GENERATE_SCRIPT not found."
    exit 1
fi

# Check if build_project.sh exists
if [ ! -f "$BUILD_SCRIPT" ]; then
    echo "Error: $BUILD_SCRIPT not found."
    exit 1
fi

# Check if generator argument is provided
GENERATOR=${1:-"Unix Makefiles"}

# Call generate_build.sh to generate the build files with the generator
echo "Running $GENERATE_SCRIPT to generate build files with generator: $GENERATOR..."
$GENERATE_SCRIPT "$GENERATOR"

if [ $? -ne 0 ]; then
    echo "Error: $GENERATE_SCRIPT failed."
    exit 1
fi

# Call build_project.sh to build the project
echo "Running $BUILD_SCRIPT to build the project..."
$BUILD_SCRIPT

if [ $? -eq 0 ]; then
    echo "Build process completed successfully."
else
    echo "Error: Build process failed."
    exit 1
fi
