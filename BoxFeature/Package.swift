// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "BoxFeature",
  products: [
    .library(
      name: "BoxFeature",
      targets: ["BoxFeature"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "BoxFeature",
      dependencies: []),
    .testTarget(
      name: "BoxFeatureTests",
      dependencies: ["BoxFeature"]),
  ]
)
