#!/bin/bash

swift build --fetch
rm -rf Packages/*/Tests
swift build
swift build --configuration release
swift test
./test