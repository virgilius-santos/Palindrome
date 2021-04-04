// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "FoundationFunctionsFeature",
  products: [
    .library(
      name: "FoundationFunctionsFeature",
      targets: ["FoundationFunctionsFeature"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "FoundationFunctionsFeature",
      dependencies: []),
    .testTarget(
      name: "FoundationFunctionsFeatureTests",
      dependencies: ["FoundationFunctionsFeature"]),
  ]
)
