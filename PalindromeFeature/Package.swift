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
    .package(path: "./FoundationFuncionsFeature"),
    .package(path: "./BoxFeature")
  ],
  targets: [
    .target(
      name: "PalindromeFeature",
      dependencies: [
        "UIKitFunctionsFeature",
        "FunctionsFeature",
        "ResourcesFeature",
        "FoundationFuncionsFeature",
        "BoxFeature"
      ]),
    .testTarget(
      name: "PalindromeFeatureTests",
      dependencies: ["PalindromeFeature"]),
  ]
)
