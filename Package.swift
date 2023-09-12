// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SirioKitIOS",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SirioKitIOS",
            targets: ["SirioKitIOS"]),
        
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI", from: "2.2.3"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSVGCoder", from: "1.7.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SirioKitIOS",
            dependencies: ["SDWebImageSwiftUI", "SDWebImageSVGCoder"],
            resources: [.process("Fonts"), .process("Resources")]
        ),
        .testTarget(
            name: "SirioKitIOSTests",
            dependencies: ["SirioKitIOS"]),
    ]
)
