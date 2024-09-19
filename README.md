# swiftui_xcode16_bug
A minimal repository showcasing a fatal crash when using Capacitor 6 with Xcode 16. The SwiftUI app attempts to load the `SwiftUICore` library on launch, causing a crash on iOS 17 and below where `SwiftUICore` is unavailable.
