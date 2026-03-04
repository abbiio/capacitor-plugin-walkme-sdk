// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "CapacitorPluginWalkmeSdk",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "CapacitorPluginWalkmeSdk",
            targets: ["WalkMeSDKPlugin"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm", from: "8.0.0"),
        .package(url: "https://github.com/abbiio/iosdk", from: "2.20.8")
    ],
    targets: [
        .target(
            name: "WalkMeSDKPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm"),
                .product(name: "WalkMeSDK", package: "iosdk")
            ],
            path: "ios/Plugin",
            exclude: ["Info.plist", "WalkMeSDKPlugin.h", "WalkMeSDKPlugin.m"]
        )
    ]
)
