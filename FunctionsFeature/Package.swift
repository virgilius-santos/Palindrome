// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "FunctionsFeature",
  products: [
    .library(
      name: "FunctionsFeature",
      targets: ["FunctionsFeature"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "FunctionsFeature",
      dependencies: []),
    .testTarget(
      name: "FunctionsFeatureTests",
      dependencies: ["FunctionsFeature"]),
  ]
)
