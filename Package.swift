// swift-tools-version:5.3

import Foundation
import PackageDescription

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
  name: "ScadeProject",
  platforms: [
    .macOS(.v10_14)
  ],
  products: [
    .library(
      name: "ScadeProject",
      type: .static,
      targets: [
        "ScadeProject"
      ]
    )
  ],
  dependencies: [
    .package(
      name: "ScadeExtensions", url: "https://github.com/scade-platform/ScadeExtensions",
      .branch("main")),
    .package(
      name: "Android", url: "https://github.com/scade-platform/swift-android.git",
      .branch("android/24")),
  ],
  targets: [
    .target(
      name: "ScadeProject",
      dependencies: [
        .product(name: "Android", package: "Android", condition: .when(platforms: [.android])),
        .product(name: "AndroidOS", package: "Android", condition: .when(platforms: [.android])),
        .product(name: "AndroidApp", package: "Android", condition: .when(platforms: [.android])),
        .product(
          name: "AndroidContent", package: "Android", condition: .when(platforms: [.android])),
      ],
      exclude: ["main.page"],
      swiftSettings: [
        .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
        .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
      ]
    )
  ]
)
