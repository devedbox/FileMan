// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Fileman",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(name: "Fileman",targets: ["Fileman"]),
        .library(name: "Path", targets: ["Path"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Fileman",
            dependencies: []),
        .target(
            name: "Path",
            dependencies: []),
        .testTarget(
            name: "PathTests",
            dependencies: ["Path"],
            path: "Tests/PathTests"),
        .testTarget(
            name: "FilemanTests",
            dependencies: ["Fileman"]),
    ]
)
