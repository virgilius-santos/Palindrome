// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "PalindromeFeature",
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "PalindromeFeature",
      targets: ["PalindromeFeature"]),
  ],
  dependencies: [
    .package(path: "./UIKitFunctionsFeature"),
    .package(path: "./FunctionsFeature"),
    .package(path: "./ResourcesFeature"),
    .package(path: "./FoundationFunctionsFeature"),
    .package(path: "./BoxFeature")
  ],
  targets: [
    .target(
      name: "PalindromeFeature",
      dependencies: [
        "UIKitFunctionsFeature",
        "FunctionsFeature",
        "ResourcesFeature",
        "FoundationFunctionsFeature",
        "BoxFeature"
      ]),
    .testTarget(
      name: "PalindromeFeatureTests",
      dependencies: ["PalindromeFeature"]),
  ]
)
