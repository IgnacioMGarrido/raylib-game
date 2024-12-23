# Raylib Starter Project

Small project that sets up raylib

## Instructions
# Scripts

You can use the scripts provided inside the `scripts` folder

```
./scripts/generate_build.sh "{GENERATOR}"
./scripts/build_project.sh
```

or

```
./scripts/generate_and_build.sh "{GENERATOR}"
```

Default generator is `UNIX_MAKEFILES`

the executable will be located `./build/RaylibGame`

# Manual
- Make the build folder inside the project

```
mkdir build
cd build
```

- Generate and build the project

```
cmake ..
cmake -build .
```

