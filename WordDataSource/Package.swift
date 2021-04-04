// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "WordDataSource",
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "WordDataSource",
      targets: ["WordDataSource"]
    ),
    .library(
      name: "WordDataSourceLive",
      targets: ["WordDataSourceLive"]
    ),
  ],
  dependencies: [
    .package(name: "Realm", url: "https://github.com/realm/realm-cocoa.git", from: Version(10, 7, 2)),
  ],
  targets: [
    .target(
      name: "WordDataSource",
      dependencies: []
    ),
    .testTarget(
      name: "WordDataSourceTests",
      dependencies: ["WordDataSource"]
    ),
    .target(
      name: "WordDataSourceLive",
      dependencies: ["Realm", .product(name: "RealmSwift", package: "Realm"),]
    ),
  ]
)
