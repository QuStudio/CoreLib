#!/bin/bash
# ./test script

xcodebuild test \
    -project Vocabulaire.xcodeproj \
    -scheme "Vocabulaire Mac" \
    -destination "platform=OS X,arch=x86_64" \
    | xcpretty && exit ${PIPESTATUS[0]}