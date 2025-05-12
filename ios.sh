#!/bin/bash

clear
sh inc.sh

# https://dart.dev/tools/dart-fix
dart fix --apply

# https://dart.dev/tools/dart-format
dart format .

flutter clean && flutter build ipa
# ios/Pods/FirebaseCrashlytics/upload-symbols -gsp ios/GoogleService-Info.plist -p ios build/ios/archive/Runner.xcarchive/dSYMs
