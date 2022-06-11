// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApolloCodegen",
    platforms: [
        .macOS(.v10_14)
    ],
    dependencies: [
        // The actual Apollo library
        .package(name: "Apollo",
                 url: "https://github.com/apollographql/apollo-ios.git",
                 /// Make sure this version matches the version in your iOS project!
                 .upToNextMajor(from: "0.51.2")),
        
        // The official Swift argument parser.
        .package(url: "https://github.com/apple/swift-argument-parser.git",
                 .upToNextMinor(from: "0.3.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ApolloCodegen",
            dependencies: [
                .product(name: "ApolloCodegenLib", package: "Apollo"),
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .testTarget(
            name: "ApolloCodegenTests",
            dependencies: ["ApolloCodegen"]),
    ]
)
