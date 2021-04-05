// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "PalindromeFeature",
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "PalindromeFeature",
      targets: ["PalindromeFeature"]
    ),
    .library(
      name: "PalindromeFeatureLive",
      targets: ["PalindromeFeatureLive"]
    ),
  ],
  dependencies: [
    .package(path: "./UIKitFunctionsFeature"),
    .package(path: "./FunctionsFeature"),
    .package(path: "./ResourcesFeature"),
    .package(path: "./FoundationFunctionsFeature"),
    .package(path: "./BoxFeature"),
    .package(path: "./WordDataSource"),
  ],
  targets: [
    .target(
      name: "PalindromeFeature",
      dependencies: [
        "UIKitFunctionsFeature",
        "FunctionsFeature",
        "ResourcesFeature",
        "FoundationFunctionsFeature",
        "BoxFeature",
        "WordDataSource",
      ]
    ),
    .target(
      name: "PalindromeFeatureLive",
      dependencies: ["PalindromeFeature"]
    ),
    .testTarget(
      name: "PalindromeFeatureTests",
      dependencies: ["PalindromeFeatureLive"]
    ),
  ]
)
