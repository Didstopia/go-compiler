#!/usr/bin/env bash

# Build the image
docker build --rm -t didstopia/go-compiler:latest .

# Compile Go
docker run --rm -v ${PWD}/.cache:/tmp -v ${PWD}/data:/data didstopia/go-compiler:latest

# Sign the compiled binaries
./codesign.sh
