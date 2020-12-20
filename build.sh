#!/bin/bash

swift build --configuration release
cp -f .build/release/firebase-os-breakdown /usr/local/bin/firebase-os-breakdown