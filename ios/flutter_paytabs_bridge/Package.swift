// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "flutter_paytabs_bridge",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(name: "flutter-paytabs-bridge", targets: ["flutter_paytabs_bridge"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "flutter_paytabs_bridge",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                "PaymentSDK"
            ]
        ),
        // Pinned to the tag URL; PayTabs' own manifest points at master, which breaks older tags.
        .binaryTarget(
            name: "PaymentSDK",
            url: "https://github.com/paytabscom/paytabs-ios-library-sample/raw/6.6.55/sources/PaymentSDK.xcframework.zip",
            checksum: "dd911f4f94fa6c79d5ee6ba83a40405a9ed4a9700cbf989b9e9b2cee9b74b203"
        )
    ]
)
