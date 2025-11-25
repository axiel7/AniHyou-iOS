// swift-tools-version:6.1

import PackageDescription

let package = Package(
  name: "AniListAPI",
  platforms: [
    .iOS(.v15),
    .macOS(.v12),
    .tvOS(.v15),
    .watchOS(.v8),
    .visionOS(.v1),
  ],
  products: [
    .library(name: "AniListAPI", targets: ["AniListAPI"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios", from: "2.0.0"),
  ],
  targets: [
    .target(
      name: "AniListAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
  ],
  swiftLanguageModes: [.v6, .v5]
)
