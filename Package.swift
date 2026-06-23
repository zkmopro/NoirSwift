// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NoirSwift",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NoirSwift",
            targets: ["NoirSwift"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NoirSwift",
            dependencies: ["NoirBindings"],
            path: "Sources/"
        ),
        .binaryTarget(
            name: "NoirBindings",
            url: "https://github.com/zkmopro/NoirSwift/releases/download/v1.0.0-beta.19/NoirBindings.xcframework.zip",
            checksum: "00b6234deb548e3eac1eccb33592d94a78c13ea0a5074b38114a3b8f12aa21fc"
        ),
        .testTarget(
            name: "NoirSwiftTests",
            dependencies: ["NoirSwift"],
            path: "Tests/",
            resources: [
                .process("TestVectors/noir_multiplier2.json"),
                .process("TestVectors/noir_multiplier2.srs")
            ]
        ),
    ]
)
