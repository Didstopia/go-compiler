#!/usr/bin/env bash

# Pull the latest image
docker pull didstopia/go-compiler:latest

# Build the image
docker build --rm -t didstopia/go-compiler:latest .

# Compile Go
docker run --rm -v ${PWD}/.cache:/tmp -v ${PWD}/data:/data -e GOARCH=arm64 -e GOOS=darwin didstopia/go-compiler:latest

# Sign the compiled binaries
./codesign.sh
