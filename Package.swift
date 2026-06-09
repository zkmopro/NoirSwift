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
            url: "https://ci-keys.zkmopro.org/NoirBindings.xcframework.zip",
            // TODO(v1.0.0-beta.19): recompute after rebuilding & re-uploading the
            // xcframework (`mopro build ios` from the beta.19 mopro-example-app-noir,
            // then `swift package compute-checksum NoirBindings.xcframework.zip`).
            // The current value is the beta.8 binary's checksum.
            checksum: "d00d834365706a621c9832803b96a5ac3bbdf35aacb77f0b76e259820761b1d3"
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
