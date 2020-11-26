#!/usr/bin/env bash

set -e
set -o pipefail

#set -x

echo "Preparing to compile Go with the following parameters:"
echo "* Go target version: ${GOLANG_VERSION}"
echo "* Go target architecture: ${GOARCH}"
echo "* Go target platform: ${GOOS}"
echo ""

if [ ! -d /tmp/go/.git ]; then
  echo "> Downloading Go from the ${GO_BRANCH} branch"
  output=`(git clone --depth 1 --branch $GO_BRANCH https://github.com/golang/go.git /tmp/go) 2>&1` || echo $output
else
  echo "> Updating Go from the ${GO_BRANCH} branch"
  output=`(cd /tmp/go && git reset --hard && git checkout $GO_BRANCH && git pull) 2>&1` || echo $output
fi

echo "> Compiling Go (grab a coffee, this will take a while)"
output=`(rm -fr "/tmp/go-${GOOS}-${GOARCH}-bootstrap" "/tmp/go-${GOOS}-${GOARCH}-bootstrap.tbz" && cd /tmp/go/src && ./bootstrap.bash) 2>&1` || echo $output

echo "> Copying compiled binaries to the /data folder"
output=`(tar -xjf "/tmp/go-${GOOS}-${GOARCH}-bootstrap.tbz" -C /data --strip-components=1) 2>&1` || echo $output

echo ""
echo "All done, enjoy your freshly baked binaries!"
