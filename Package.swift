// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpeedometerSwiftUI",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Content",
            targets: ["SpeedometerSwiftUI"]),
    ],
    targets: [
        .target(
            name: "SpeedometerSwiftUI")
    ]
)
