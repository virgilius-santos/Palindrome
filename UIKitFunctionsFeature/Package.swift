// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "UIKitFunctionsFeature",
  products: [
    .library(
      name: "UIKitFunctionsFeature",
      targets: ["UIKitFunctionsFeature"]),
  ],
  dependencies: [
    .package(path: "./FunctionsFeature")
  ],
  targets: [
    .target(
      name: "UIKitFunctionsFeature",
      dependencies: ["FunctionsFeature"]),
    .testTarget(
      name: "UIKitFunctionsFeatureTests",
      dependencies: ["UIKitFunctionsFeature"]),
  ]
)
