// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdyenNetworking",
    products: [
        .library(
            name: "AdyenNetworking",
            targets: ["AdyenNetworking"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AdyenNetworking",
            dependencies: []),
        .testTarget(
            name: "AdyenNetworkingTests",
            dependencies: ["AdyenNetworking"]),
    ]
)
