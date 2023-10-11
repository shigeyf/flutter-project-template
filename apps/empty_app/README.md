# Flutter App Template (app_template)

This folder contains a new Flutter project template.

## How to build this project

1. Get all package dependencies.

   ```bash
   flutter pub get
   ```

2. Run a debug app on your devices or simulators

   ```bash
   flutter run
   ```

## How to change application name

This template has three types of its own names as below:

- The description to use for your new Flutter project. This string ends up in the pubspec.yaml file (defaults to "A new Flutter project.").

- The organization responsible for your new Flutter project, in reverse domain name notation. This string is used in Java package names and as prefix in the iOS bundle identifier (defaults to "com.example").

- The project name for this new Flutter project. This must be a valid dart package name.

To change the names, the following files must be changed with your preferred name:

- pubspec.yaml
- android/app/build.grade
- android/app/src/main/AndroidManifest.xml
- android/app/src/main/kotlin/com/example/app_template/MainActivity.kt
- ios/Runner/Info.plist
- ios/Runner.xcodeproj/project.pbxproj
- web/index.html
- web/manifest.json
