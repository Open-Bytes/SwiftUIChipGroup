// swift-tools-version:5.3

import PackageDescription

let buildTests = false

let package = Package(
        name: "SwiftUIChipGroup",
        platforms: [
            .macOS(.v10_15),
            .iOS(.v13),
            .tvOS(.v13),
        ],
        products: [
            .library(
                    name: "SwiftUIChipGroup",
                    targets: ["SwiftUIChipGroup"]
            )
        ],
        dependencies: [],
        targets: [
            .target(
                    name: "SwiftUIChipGroup",
                    dependencies: [],
                    path: "Sources")
        ]
)
