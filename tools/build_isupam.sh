#!/bin/bash

OS_TARGETS="linux darwin freebsd windows"

for os in $OS_TARGETS
do
  echo "Build isupam for ${os}"
  if [ "$os" = "windows" ]; then
    GOOS=$os go build -v -ldflags "-s -w" -o bin/isupam_$os.exe ./cmd/isupam
  else
    GOOS=$os go build -v -ldflags "-s -w" -o bin/isupam_$os ./cmd/isupam
  fi
done
