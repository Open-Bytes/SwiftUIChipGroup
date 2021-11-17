// swift-tools-version:5.1
import PackageDescription

let buildTests = false

let package = Package(
        name: "SwiftUIChipGroup",
        platforms: [
            .macOS(.v10_15), .iOS(.v13), .tvOS(.v13)
        ],
        products: [
            .library(name: "ChipGroup", targets: ["ChipGroup"])
        ],
        dependencies: [],
        targets: [
            .target(
                    name: "ChipGroup",
                    dependencies: [],
                    path: "Sources",
                    exclude: ["Tests", "Examples"])
        ]
)
