# Capacitor 6 & Xcode 16 SwiftUI Crash Example

## Overview

This repository contains a minimal reproducible example demonstrating a crash that occurs when using Capacitor 6 with Xcode 16. The crash is triggered on launch due to a failure to load the `SwiftUICore` library when running the app on iOS 17 and below. This issue is specific to applications built with Capacitor and does not occur in standard Swift projects without Capacitor.

## Problem Description

When using Capacitor 6 with Xcode 16, certain SwiftUI components, such as `UIViewRepresentable`, cause the app to crash on launch on devices running iOS 17 or earlier. The crash is caused by the app attempting to load the `SwiftUICore` library, which is only available starting from iOS 18.

### Key Details

- **Capacitor Version:** 6
- **Xcode Version:** 16
- **iOS Versions Affected:** iOS 17 and below
- **SwiftUI Components Involved:** `UIViewRepresentable`, others requiring `SwiftUICore`
- **SwiftUICore Framework:** Introduced in iOS 18, not present in earlier iOS versions.

## Steps to Reproduce

1. Clone this repository:
    ```bash
    git clone https://github.com/yourusername/swiftui_xcode16_bug.git
    ```
2. Open the project in Xcode 16.
3. Build and run the application on a device or simulator running iOS 17 or below.
4. Observe the crash upon launch with an error indicating that the `SwiftUICore` library could not be loaded.

## Expected Behavior

Xcode 16 should recognize that the `SwiftUICore` library is only available starting from iOS 18 and handle applications targeting iOS 17 and below appropriately. The app should not crash on launch due to the absence of `SwiftUICore`, and instead, the build process should either provide fallback functionality or omit the dependency as needed.

While this issue might point to a bug within Xcode 16, it appears to be specifically triggered when using Capacitor 6. The issue does not occur in fresh Swift projects without Capacitor, suggesting that Capacitor may be influencing or exacerbating the problem.

## Workaround

To temporarily mitigate this issue, you can adjust the build settings of your project to weakly link the `SwiftUICore` library. This allows the app to run without a strict connection to the library, preventing the crash on iOS versions where `SwiftUICore` is unavailable.

Add `-weak_framework SwiftUICore` to the **Other Linker Flags** (OTHER_LDFLAGS) section of the **Build Settings** tab of your app target.

## Environment and Tools

- **npm Version:** 9.5.1
- **Node.js Version:** v18.16.0
- **CocoaPods Version:** 1.15.2

## Error Message

```
dyld[13751]: Library not loaded: /System/Library/Frameworks/SwiftUICore.framework/SwiftUICore
  Referenced from: <A00D3A69-48D0-3CC2-98D6-AE0A53AE71EA> /private/var/containers/Bundle/Application/225B66E0-54FC-44C9-93FB-FDDE61610ADD/App.app/App.debug.dylib
  Reason: tried: '/System/Library/Frameworks/SwiftUICore.framework/SwiftUICore' (no such file), '/private/preboot/Cryptexes/OS/System/Library/Frameworks/SwiftUICore.framework/SwiftUICore' (no such file), '/System/Library/Frameworks/SwiftUICore.framework/SwiftUICore' (no such file, not in dyld cache)
```

Feel free to adjust the repository URL, workaround instructions, or any other specifics to better fit your actual project. If you need further modifications or assistance, just let me know!
