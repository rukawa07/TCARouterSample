// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MessageFeature",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MessageFeature",
            targets: ["MessageFeature"]),
    ],
    dependencies: [
        .package(path: "../../Core/FeatureLibrary")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MessageFeature",
            dependencies: [
                .product(name: "FeatureLibrary", package: "FeatureLibrary")
            ]
        ),
        .testTarget(
            name: "MessageFeatureTests",
            dependencies: ["MessageFeature"]
        ),
    ]
)
