#!/bin/bash

swift build --configuration release
cp -f .build/release/FirebaseOSBreakdown /usr/local/bin/FirebaseOSBreakdown